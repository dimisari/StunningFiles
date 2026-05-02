{-# language LambdaCase #-}

import System.Process qualified as SP
import System.Environment qualified as SE

main :: IO ()
main =
  SE.getArgs >>= \case
    [s] -> correct_arg s
    _ -> putStrLn "Usage: script toBeReplaced"

correct_arg :: String -> IO ()
correct_arg = \s ->
  print_grep s >>
  call_grep s >>
  putStrLn "Exclude dirs? [y/N]" >>
  getLine >>= is_yes_no (exlude_dirs s) undefined

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

find_sed_beginning :: String
find_sed_beginning = "find . -type f -exec sed -i -E \"s/"

find_sed_end :: String
find_sed_end = "/g\" {} \\;"

find_sed :: String -> String -> String
find_sed = \a b -> find_sed_beginning ++ a ++ "/" ++ b ++ find_sed_end

-- print/call commands

print_grep :: String -> IO ()
print_grep = putStrLn . grep

call_grep :: String -> IO ()
call_grep = SP.callCommand . grep

call_grep_exclude_dirs :: String -> String -> IO ()
call_grep_exclude_dirs = \dirs s -> SP.callCommand $ grep_exclude_dirs dirs s

call_find_sed :: String -> String -> IO ()
call_find_sed = \a b -> SP.callCommand $ find_sed a b

--

new_s1 :: String -> (String, Bool) {asdfsdaf} [fasdfsd]
new_s1 = \case
  "" -> ("", False)
  '[' : s -> ("([" ++ s ++ ")", True)
  c : s -> (\(s_new, b) -> (c : s_new, b)) $ new_s1 s

s2_end :: String -> String
s2_end = \s1 ->
  case new_s1 s1 of
    (_, True) -> "\\1"
    _ -> ""

--

exlude_dirs :: String -> IO ()
exlude_dirs = \s ->
  putStrLn "Write the dirs seperated by spaces" >>
  getLine >>= \dirs_str ->
  putStrLn (grep_exclude_dirs dirs_str s) >>
  call_grep_exclude_dirs dirs_str s >>
  putStrLn "Proceed to replacing?"

-- is_yes_no

is_yes_no :: IO () -> IO () -> String -> IO ()
is_yes_no = \do_yes do_no s -> case is_yes s of
  True -> do_yes
  False -> case is_no s of
    True -> do_no
    False -> putStrLn "Unexpected answer"

is_yes :: String -> Bool
is_yes = flip elem ["y", "Y", "yes", "YES"]

is_no :: String -> Bool
is_no = flip elem ["", "n", "N", "no", "NO"]

