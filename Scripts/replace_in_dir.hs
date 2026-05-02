{-# language LambdaCase #-}

import System.Process qualified as SP
import System.Environment qualified as SE
import Data.List.Split qualified as DLS

-- main

main :: IO ()
main =
  SE.getArgs >>= \case
    [s] -> initial_grep s
    _ -> putStrLn "Usage: script toBeReplaced"

-- interactions

initial_grep :: String -> IO ()
initial_grep = \s ->
  putStrLn "" >>
  print_and_call (grep s) >>
  putStrLn "\nExclude dirs? [y/N]" >>
  is_yes_no (exlude_dirs s) (ask_replace s)

exlude_dirs :: String -> IO ()
exlude_dirs = \s ->
  putStrLn "Write the dirs seperated by spaces" >>
  getLine >>= \dirs_str ->
  print_and_call (grep_exclude_dirs dirs_str s) >>
  ask_replace_exclude_dirs dirs_str s

ask_replace :: String -> IO ()
ask_replace = \s ->
  putStrLn "Proceed to replacing? [y/N]" >>
  at_yes_do (replace s)

ask_replace_exclude_dirs :: String -> String -> IO ()
ask_replace_exclude_dirs = \dirs_str s ->
  putStrLn "Proceed to replacing? [y/N]" >>
  at_yes_do (replace_exclude_dirs dirs_str s)

general_replace :: (String -> String) -> IO ()
general_replace = \f ->
  putStrLn "Replace with:" >>
  getLine >>= \l ->
  putStrLn "" >>
  print_and_call (f l) >>
  putStrLn "" >>
  case l of
    "" -> pure ()
    _ -> print_and_call (grep $ remove_nl l) >> putStrLn ""

replace :: String -> IO ()
replace = \s -> general_replace (find_sed s)

replace_exclude_dirs :: String -> String -> IO ()
replace_exclude_dirs = \dirs_str s ->
  general_replace (find_sed_exclude_dirs dirs_str s)

-- command strs

grep_beginning :: String
grep_beginning = "grep -rnI --color=auto "

quoted :: String -> String
quoted = \s -> "\"" ++ s ++ "\""

grep :: String -> String
grep = \s -> grep_beginning ++ quoted s

grep_exclude_dirs :: String -> String -> String
grep_exclude_dirs = \dirs_str s ->
  grep_beginning ++ exclude_str dirs_str ++ " " ++ quoted s

exclude_str :: String -> String
exclude_str = concatMap (" --exclude-dir=" ++) . words

find_sed_end :: String -> String -> String
find_sed_end = \a b ->
  " -type f -exec sed -i -E " ++ substitution a b ++ " {} \\;"

substitution :: String -> String -> String
substitution = \a b -> quoted $ "s/" ++ a ++ "/" ++ b ++ "/g"

find_sed :: String -> String -> String
find_sed = \a b -> "find ." ++ find_sed_end a b

find_sed_exclude_dirs :: String -> String -> String -> String
find_sed_exclude_dirs = \dirs_str a b ->
  "find ." ++ find_exclude_dirs dirs_str ++ find_sed_end a b

find_exclude_dirs :: String -> String
find_exclude_dirs = concatMap find_exclude_dir . words

find_exclude_dir :: String -> String
find_exclude_dir = \s ->
  " -path " ++ quoted ("./" ++ s) ++ " -prune -o"

--

print_and_call :: String -> IO ()
print_and_call = \s -> putStrLn s >> SP.callCommand s

remove_nl :: String -> String
remove_nl = concat . DLS.splitOn "\\n"

-- is_yes_no

is_yes_no :: IO () -> IO () -> IO ()
is_yes_no = \do_yes do_no ->
  getLine >>= \s ->
  case is_yes s of
    True -> do_yes
    False -> case is_no s of
      True -> do_no
      False -> putStrLn "Unexpected answer"

at_yes_do :: IO () -> IO ()
at_yes_do = \do_yes -> is_yes_no do_yes (pure ())

is_yes :: String -> Bool
is_yes = flip elem ["y", "Y", "yes", "YES"]

is_no :: String -> Bool
is_no = flip elem ["", "n", "N", "no", "NO"]

