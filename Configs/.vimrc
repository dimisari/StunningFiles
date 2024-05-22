"make leftmost column some beautiful color +
"column 80 red (and scary. don't go)
set foldcolumn=1
highlight FoldColumn ctermbg=6
set colorcolumn=80

"searh options:
"  _h_igh_l_ight _search_ + while typing the search (_inc_rementally)
set hlsearch incsearch
"  _case_ insensitive (_ignore_) +
"  become case sensitive in capital letters (_smart_)
set ignorecase smartcase

"self explanatory and awesome
set autoindent

"tab options:
"  it is 2 spaces + make it actual spaces (_expand_) +
"  auto _shift(width)_ (e.g. inside multiline paren expr) is also 2 spaces
set tabstop=2 expandtab shiftwidth=2

"start _scroll_ing 10 lines (_off_set) before hitting any edge
"because why would you want your cursor that far
set scrolloff=10

"_show_ where a line is broken(_break_) because of hugeness
"with "--->" as the 4 first chars (cannot be reached by cursor)
set showbreak=--->

"_show_ number of selected characters in visual mode
"  (among other things it seems)
set showcmd

"disable swap files (saved my life)
set noswapfile

"You'll probably need -> :help key-notation

"If system clipboard copy and paste don't work: sudo apt intall vim-gtk
"  (if not in debian-based distro figure it out by yourself)

"Always noremap so that I don't use macros inside macros and
"  confuse myself I guess

"general maps (I believe that means normal + visual mode)

  "left/down/up/right for normal people
  "  that follow the standard typing guidelines
  noremap j h
  noremap k j
  noremap l k
  noremap ; l

  "_s_earch
  noremap s /
  "x: delete and get into insert mode (deletes cursor char in normal mode)
  noremap x s

  "_p/P_aste after/at cursor from clipboard
  "  or on top of selected text if in visual mode
  noremap p "+p
  noremap P "+P
  "space + p/P + letter
  "  => _p/P_aste from register with that letter: after/at cursor
  noremap <expr> <Space>p "\"" . nr2char(getchar()) . "p"
  noremap <expr> <Space>P "\"" . nr2char(getchar()) . "P"

  "go to first char of line
  noremap <Space>j ^
  "go to last char of line
  noremap <Space>; $h
  "toggle between opening and closing in all brackets
  noremap zj %

  "LOVE these
  "  next/previous search match + center cursor vertically
  noremap n nzz
  noremap N Nzz
  "  paragraph down/up (next/previous empty line) + center cursor vertically
  noremap K }zz
  noremap L {zz
  "  half page down/up + center cursor vertically
  noremap <C-k> <C-d>zz
  noremap <C-l> <C-u>zz

  "_c_omment/_u_ncomment line (# comment)
  noremap <C-c> 0i# <Esc>
  noremap <C-u> 0d2l

  "down/up for huge lines that are broken
  "  (better to use gq to fix them but just in case)
  noremap gk gj
  noremap gl gk

"normal mode maps

  "_c_opy line into system clipboard
  nnoremap c "+yy

  "_D_elete line (into system clipboard)
  nnoremap D "+dd

  "_d_elete single character (into system clipboard)
  nnoremap d "+x

  "_r_eplace all occurences of word under cursor with ...
  nnoremap r :%s/\<<C-r><C-w>\>//g<Left><Left>

  "_s_earch word under cursor + center cursor vertically
  nnoremap <Space>s *Nzz

  "save
  nnoremap <Space>z :w<CR>

  "_q_uit (without saving)
  nnoremap <Space>q :q!<CR>

  "add space at/after cursor
  nnoremap <Space>i i<Space><Esc>
  nnoremap <Space>a a<Space><Esc>

  "add empty line above/below cursor
  nnoremap <Space>O O<Esc>j
  nnoremap <Space>o o<Esc>k

  "(add tab/remove tab) at cursor
  nnoremap <Space>> <C-v>>
  nnoremap <Space>< <C-v><

  "remove previous search _h_ighlighting
  nnoremap h :noh<CR>

  "find character with f + char (does it with search so that n/N can be used)
  nnoremap <expr> f "/" . nr2char(getchar()) . "<CR>:noh<CR>"
  "same but backwards with F instead of f
  nnoremap <expr> F "/" . nr2char(getchar()) . "<CR>N:noh<CR>"

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
  nnoremap <Space>H K

  "Haskell maps
    "value def
    nnoremap <Space>hv o<Esc>o__ :: __<CR>__ = __<Esc>{/__<CR>

    "type
    nnoremap <Space>ht o<Esc>otype __ = __<CR><Esc>{/__<CR>

    "data
    nnoremap <Space>hd o<Esc>odata __ =<CR>  __ \| __<CR><Esc>{/__<CR>

    "class
    nnoremap <Space>hc o<Esc>oclass __ where<CR>  __ :: __<CR><Esc>{/__<CR>

    "instance
    nnoremap <Space>hi o<Esc>oinstance __ where<CR>  __ = __<CR><Esc>{/__<CR>

  "latex maps
    "reload pdf
    nnoremap <Space>LR :w<CR> :! pdflatex -output-directory Pdf %<CR><CR>

    "begin and end verbatim + put cursor inside
    nnoremap <Space>LV
      \ o<Esc>o\begin{verbatim}<CR>\end{verbatim}<CR><Esc>kko<Esc>

    "begin and end itemize + put cursor inside
    nnoremap <Space>LI
      \ o<Esc>o\begin{itemize}<CR>\end{itemize}<CR><Esc>kko\item<Esc>

  "run command under cursor and print output underneath
  nnoremap <Space>c 0v$h"cy:r!<C-r>c<CR>

"visual mode maps

  "replace all occurences of visually selected text
  vnoremap r "hy:%s/<C-r>h//g<Left><Left>

  "search visually selected text
  vnoremap <Space>s y/\V<C-R>=escape(@",'/\')<CR><CR>N

  "replace something inside only inside the viusally selected text
  vnoremap <Space>r :s///g<Left><Left><Left>

  "go to normal mode
  vnoremap <C-j> <Esc>

  "space at cursor column (used in visual block for multiple lines)
  vnoremap <Space>i I<Space><Esc>

  "copy/delete visually selected text
  vnoremap c "+y
  vnoremap d "+d

  "space + c + letter => copy visually selected text to register with that letter
  vnoremap <expr> <Space>c "\"" . nr2char(getchar()) . "y"

  "enclose visually selected text in () [] {} <> "" ''
  vnoremap <Space>ep s(<c-r>")<Esc>%
  vnoremap <Space>es s[<c-r>"]<Esc>%
  vnoremap <Space>eb s{<c-r>"}<Esc>%
  vnoremap <Space>e< s<<c-r>"><Esc>%
  vnoremap <Space>e" s"<c-r>""<Esc>%
  vnoremap <Space>e' s'<c-r>"'<Esc>%

  "select all text inside () [] {}
  vnoremap ip ib
  vnoremap is i[
  vnoremap ib i{

  "select all text inside and including () [] {}
  vnoremap ap ab
  vnoremap as a[
  vnoremap ab a{
  "same plus "" ''
  vnoremap ( ab
  vnoremap [ a[
  vnoremap { a{
  vnoremap " a"
  vnoremap ' a'

  "find character with f + char (does it with search so that n/N can be used)
  vnoremap <expr> f "/" . nr2char(getchar()) . "<CR>"
  "same but backwards with F instead of f
  vnoremap <expr> F "/" . nr2char(getchar()) . "<CR>N"

  "comment/uncomment selected text
    "Bash/Python
    vnoremap <C-c> :norm i# <CR>
    vnoremap <C-u> :norm dd<CR>

    "Haskell
    vnoremap <Space>hc :norm i-- <CR>
    vnoremap <Space>hu :norm ddd<CR>

"insert mode maps

  "autocomplete with tab
  inoremap <Tab> <C-n>
  "k l navigation in autocomplete
  inoremap <expr> k pumvisible() ? "\<C-N>" : "k"
  inoremap <expr> l pumvisible() ? "\<C-P>" : "l"

  "open and close automatically () [] {} <> "" ''
  inoremap ( ()<Esc>i
  inoremap [ []<Esc>i
  inoremap { {}<Esc>i
  inoremap < <><Esc>i
  inoremap " ""<Esc>i
  inoremap ' ''<Esc>i

  "go to normal mode
  inoremap <C-j> <Esc>

"command mode maps

  "go to previous/next in searches or commands
  cnoremap <C-l> <C-p>
  cnoremap <C-k> <C-n>

  "paste in command mode
  cnoremap <C-p> <C-r>+

"custom commands
  "source vimrc
  command! S execute "source ~/.vimrc"
  "save + load current (haskell) file in ghci
  command! G execute "call Ghci()"
  command! GL execute "call GhciLong()"
  "run current (script) file
  command! R execute "!./%"

"vim functions
function Ghci()
  w
  !ghci -XLambdaCase %
endfunction

function GhciLong()
  w
  !file=$(basename $(pwd))/%; cd ..; ghci -XLambdaCase $file
endfunction

"encoding
set encoding=utf-8
"syntax highlihting
syntax on
"autocomplete in command mode (it helps, not really sure how though :p)
set wildmode=full

"enable K (which is mapped to <Space>h above)
"for help about word under cursor in vimrc
autocmd BufRead ~/.vimrc setlocal keywordprg=:help
"remove all whitespace before end of line
"  because if there is an empty line with space jumping paragraphs doens't work
"  properly and it's very annoying
autocmd BufWritePre * :%s/\s\+$//e
