"make leftmost column some beautiful color
set foldcolumn=1
highlight FoldColumn ctermbg=6

"make column 85 red
set colorcolumn=85

"scroll 10 lines before edge
set scrolloff=10

"searh options
set hlsearch incsearch ignorecase smartcase

"tab options
set expandtab tabstop=2 shiftwidth=2

"indent same as previous line, show huge line breaks
set autoindent showbreak=--->

"show selected cardinality in visual mode
set showcmd

"disable swap files
set noswapfile


"You'll probably need :help key-notation 
"If system clipboard copy and paste don't work install vim-gtk

"general maps

  "left/down/up/right for normal people who follow the standard typing guidelines
  noremap j h
  noremap k j
  noremap l k
  noremap ; l

  "search
  noremap s /
  "substitute (char in normal mode, selected text in visual mode)
  noremap x s
  "paste after/at cursor from clipboard
  noremap p "+p
  noremap P "+P
  "space + p + letter => paste from register with that letter
  noremap <expr> <Space>p "\"" . nr2char(getchar()) . "p" 

  "LOVE these
  "next/previous search match + center vertically
  noremap n nzz
  noremap N Nzz
  "paragraph down/up + center cursor vertically
  noremap K }zz
  noremap L {zz
  "half page down/up + center cursor vertically
  noremap <C-k> <C-d>zz
  noremap <C-l> <C-u>zz

  "down/up for split huge lines 
  noremap gk gj
  noremap gl gk

"normal mode maps 

  "replace all occurences of word under cursor
  nnoremap r :%s/\<<C-r><C-w>\>//g<Left><Left>

  "search word under cursor + center cursor vertically
  nnoremap <Space>s *Nzz

  "copy line into clipboard
  "nnoremap c "+yy
  "delete line into clipboard
  "nnoremap D "+dd
  "delete single character into clipboard
  "nnoremap d "+x

  "save 
  nnoremap <Space>z :w<CR>
  "quit (without saving)
  nnoremap <Space>q :q!<CR>

  "space at/after cursor
  nnoremap <Space>i i<Space><Esc>
  nnoremap <Space>a a<Space><Esc>
  "empty line above/below
  nnoremap <Space>O O<Esc>j
  nnoremap <Space>o o<Esc>k

  "(add tab/remove tab) at cursor
  nnoremap <Space>> <C-v>>
  nnoremap <Space>< <C-v><

  "remove previous search highlighting
  nnoremap h :noh<CR>

  "edit other file
  "(saves automatically to not have problems when deleting + pasting stuff)
  nnoremap <Space>e :w<CR>:e 

  "help
  nnoremap <Space>h K

  "visually select all text inside 
  "and including the next parentheses/square brackets
  nnoremap <Space>jp f(vab
  nnoremap <Space>js f[va[

  "select all
  nnoremap <C-a> ggVG

  "latex maps
    "reload
    nnoremap <Space>lr :w<CR> :! pdflatex -output-directory Pdf %<CR><CR>

    "verbatim
    nnoremap <Space>lv 
      \o<Esc>o\begin{verbatim}<CR>\end{verbatim}<CR><Esc>kko<Esc>

    "itemize
    nnoremap <Space>li 
      \o<Esc>o\begin{itemize}<CR>\end{itemize}<CR><Esc>kko<Esc>

    "latex: itemize with Examples, Description, Grammar, lm = latex many
    nnoremap <Space>lm
      \ o\begin{itemize}<CR><CR>
      \\item \textit{Examples}<CR><CR>
      \\item \textit{Description} \\\\<CR><CR>
      \\item \textit{Grammar}<CR><CR>
      \\begin{grammar}<CR><CR>
      \<grammar> ::= <grammar><CR><CR>
      \\end{grammar} <CR><CR>
      \\end{itemize}<CR><Esc>

"visual mode maps 

  "replace all occurences of visually selected text
  vnoremap r "hy:%s/<C-r>h//g<Left><Left>

  "search visually selected text
  vnoremap <Space>s y/\V<C-R>=escape(@",'/\')<CR><CR>N

  "replace something inside the viusally selected area
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
  vnoremap <Space>b s(<c-r>")<Esc>

  "comment out/uncomment selected text
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

  "go to normal mode
  inoremap mk <Esc>

"command mode maps 

  "go to previous/next in searches or commands
  cnoremap <C-l> <C-p>
  cnoremap <C-k> <C-n>

"custom commands
  "source vimrc
  command! Sv execute "source ~/.vimrc"
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
"disable syntax for alex/happy files
autocmd BufRead *.x,*.y setlocal syntax=OFF
