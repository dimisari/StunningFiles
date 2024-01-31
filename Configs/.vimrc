"make leftmost column some beautiful color + column 91 red
set foldcolumn=1
highlight FoldColumn ctermbg=6
set colorcolumn=91

"searh options:
"  highlight search + while typing the search (incremental) +
"  case insensitive (ignore) + become case sensitive in capital letters (smart)
set hlsearch incsearch ignorecase smartcase

"self explanatory and awesome
set autoindent 

"tab options:
"  it is 2 spaces + make it actual spaces (expand) +
"  autoindent inside multiline paren expr is also 2 spaces 
set tabstop=2 expandtab shiftwidth=2

"start scrolling 10 lines before hitting any edge because why would you want your 
"cursor that far
set scrolloff=10

"show where a line is broken because of hugeness with "--->" as the 4 first chars
"(cannot be reached by cursor)
set showbreak=--->

"show number of selected characters in visual mode
set showcmd

"disable swap files
set noswapfile

"You'll probably need :help key-notation 
"If system clipboard copy and paste don't work install vim-gtk

"Always noremap so that I don't use macros inside macros and confuse myself I guess

"general maps (I believe that means normal + visual mode)

  "left/down/up/right for normal people who follow the standard typing guidelines
  noremap j h
  noremap k j
  noremap l k
  noremap ; l

  "search
  noremap s /
  "substitute (cursor char in normal mode, selected text in visual mode)
  noremap x s

  "paste after/at cursor from clipboard (/on top of selected text in visual mode)
  noremap p "+p
  noremap P "+P
  "space + p/P + letter => paste from register with that letter: after/at cursor
  noremap <expr> <Space>p "\"" . nr2char(getchar()) . "p" 
  noremap <expr> <Space>P "\"" . nr2char(getchar()) . "P" 

  "delete single character into clipboard
  nnoremap d "+x
  "copy line
  nnoremap c "+yy
  "delete line into clipboard
  nnoremap D "+dd

  "go to last char of line
  noremap z $
  "toggle between opening and closing in all brackets
  noremap <Space>; %

  "LOVE these
  "next/previous search match + center cursor vertically
  noremap n nzz
  noremap N Nzz
  "paragraph down/up (next or previous empty line) + center cursor vertically
  noremap K }zz
  noremap L {zz
  "half page down/up + center cursor vertically
  noremap <C-k> <C-d>zz
  noremap <C-l> <C-u>zz

  "comment/uncomment line (# comment)
  noremap <C-c> I# <Esc>
  noremap <C-u> 0d2l

  "down/up for huge lines that are broken
  "(better to use gq to fix them but just in case)
  noremap gk gj
  noremap gl gk

"normal mode maps 

  "replace all occurences of word under cursor with ...
  nnoremap r :%s/\<<C-r><C-w>\>//g<Left><Left>

  "search word under cursor + center cursor vertically
  nnoremap <Space>s *Nzz

  "save 
  nnoremap <Space>z :w<CR>

  "quit (without saving)
  nnoremap <Space>q :q!<CR>

  "space at/after cursor
  nnoremap <Space>i i<Space><Esc>
  nnoremap <Space>a a<Space><Esc>

  "empty line above/below cursor
  nnoremap <Space>O O<Esc>j
  nnoremap <Space>o o<Esc>k

  "(add tab/remove tab) at cursor
  nnoremap <Space>> <C-v>>
  nnoremap <Space>< <C-v><

  "remove previous search highlighting
  nnoremap h :noh<CR>

  "visually select all text inside 
  "and including the next parentheses/square brackets/braces
  nnoremap <Space>jp f(vab
  nnoremap <Space>js f[va[
  nnoremap <Space>jb f{va{

  "edit other file
  "(saves automatically to not have problems when deleting + pasting stuff)
  nnoremap <Space>e :w<CR>:e 
  "edit file under cursor
  nnoremap <Space>f :w<CR>gf
  "In most files I have a few lines with all the other files I usually switch
  "to from there. I use this to switch fast. It's usually a commented area
  "at the bottom of the file so that I can combine it in with G.

  "increase/decrease int
  noremap <Space>mi <C-a>
  noremap <Space>md <C-x> 

  "select all
  nnoremap <C-a> ggVG

  "(vim) help on the word under the cursor 
  nnoremap <Space>h K

  "latex maps
    "reload pdf
    nnoremap <Space>lr :w<CR> :! pdflatex -output-directory Pdf %<CR><CR>

    "begin and end verbatim + put cursor inside
    nnoremap <Space>lv o<Esc>o\begin{verbatim}<CR>\end{verbatim}<CR><Esc>kko<Esc>

    "begin and end itemize + put cursor inside
    nnoremap <Space>li o<Esc>o\begin{itemize}<CR>\end{itemize}<CR><Esc>kko<Esc>

"visual mode maps 

  "replace all occurences of visually selected text
  vnoremap r "hy:%s/<C-r>h//g<Left><Left>

  "search visually selected text
  vnoremap <Space>s y/\V<C-R>=escape(@",'/\')<CR><CR>N

  "replace something inside only inside the viusally selected text
  vnoremap <Space>r :s///g<Left><Left><Left>

  "go to normal mode
  vnoremap mk <Esc>

  "space at cursor column (used in visual block for multiple lines)
  vnoremap <Space>i I<Space><Esc>

  "copy/delete visually selected text
  vnoremap c "+y
  vnoremap d "+d

  "space + c + letter => copy visually selected text to register with that letter
  vnoremap <expr> <Space>c "\"" . nr2char(getchar()) . "y"

  "enclose visually selected text in paren
  vnoremap <Space>e s(<c-r>")<Esc>

  "comment/uncomment selected text
    "Haskell
    vnoremap <Space>hc :norm i-- <CR>
    vnoremap <Space>hu :norm ddd<CR>

    "Bash/Python
    vnoremap <C-c> :norm i# <CR>
    vnoremap <C-u> :norm dd<CR>

"insert mode maps 

  "autocomplete with tab
  inoremap <Tab> <C-n>
  "k l navigation in autocomplete
  inoremap <expr> k pumvisible() ? "\<C-N>" : "k"
  inoremap <expr> l pumvisible() ? "\<C-P>" : "l"

  "open and close all brackets automatically
  inoremap ( ()<Esc>i
  inoremap [ []<Esc>i
  inoremap { {}<Esc>i
  inoremap < <><Esc>i

  "go to normal mode
  inoremap mk <Esc>

"command mode maps 

  "go to previous/next in searches or commands
  cnoremap <C-l> <C-p>
  cnoremap <C-k> <C-n>
  cnoremap ; <CR>

  "paste in command mode
  cnoremap <C-p> <C-r>+

"custom commands
  "source vimrc
  command! S execute "source ~/.vimrc"
  "load current (haskell) file in ghci
  command! G execute "!ghci %"
  "run current (script) file
  command! R execute "!./%"

"encoding
set encoding=utf-8
"syntax highlihting
syntax on
"autocomplete in command mode (it helps, not really sure how though :p)
set wildmode=full

"enable K (which is mapped to <Space>h above)
"for help about word under cursor in vimrc
autocmd BufRead ~/.vimrc setlocal keywordprg=:help
