"make leftmost column some beautiful color
set foldcolumn=1
highlight FoldColumn ctermbg=6

"make column 84 red
set colorcolumn=84

"scroll 10 lines before edge
set scrolloff=10

"searh options
set hlsearch incsearch

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

  "search
  noremap s /
  "substitute char
  noremap x s
  "paste after/at cursor from clipboard
  noremap p "+p
  noremap P "+P
  "next/previous in search + center cursor
  noremap n nzz
  noremap N Nzz

  "left/down/up/right + down/up for split huge lines 
  noremap j h
  noremap k j
  noremap l k
  noremap ; l
  noremap gk gj
  noremap gl gk

  "LOVE these
  "paragraph down/up + center cursor
  noremap K }zz
  noremap L {zz
  "half a page down/up + center cursor
  noremap <C-k> <C-d>zz
  noremap <C-l> <C-u>zz

  "run "tree -f > .paths" in project root (edit ".paths" appropriately)
  "use ".paths" for jumping through project files quickly

  "edit file under cursor
  noremap <space>e gf
  "jump back to ".paths"
  noremap <Space>w :e .paths<cr>

"normal mode maps 

  "replace all occurences of word under cursor
  nnoremap r :%s/\<<C-r><C-w>\>//g<Left><Left>

  "search word under cursor + center cursor
  nnoremap <Space>s *Nzz
  "... + start recording @q (AMAZINGLY useful)
  nnoremap <Space>r *Nzzqq

  "select all
  nnoremap <C-a> ggVG

  "space at/after cursor, empty line above/below
  nnoremap <Space>i i<Space><Esc>
  nnoremap <Space>a a<Space><Esc>
  nnoremap <Space>O O<Esc>j
  nnoremap <Space>o o<Esc>k

  "(add tab/remove tab) at cursor
  nnoremap <Space>> <C-v>>
  nnoremap <Space>< <C-v><

  "remove previous search highlighting
  nnoremap h :noh<CR>

  "copy line/delete line/delete single character into clipboard
  nnoremap c "+yy
  nnoremap D "+dd
  nnoremap d "+x

  "save
  nnoremap <Space>z :w<CR>
  "quit without saving
  nnoremap <Space>q :q!<CR>

  "latex reload
  nnoremap <Space>p :w<CR> :! pdflatex -output-directory Pdf %<CR><CR>

  "help
  nnoremap <Space>h K

"visual mode maps 

  "replace all occurences of visually selected text
  vnoremap r "hy:%s/<C-r>h//g<Left><Left>

  "search visually selected text/... + start recording @q (AMAZINGLY useful too)
  vnoremap <Space>s y/\V<C-R>=escape(@",'/\')<CR><CR>N
  vnoremap <Space>r y/\V<C-R>=escape(@",'/\')<CR><CR>Nqq

  "way to go to normal mode
  vnoremap mk <Esc>

  "space before (used in visual block for multiple lines)
  vnoremap <Space>i I<Space><Esc>

  "copy/delete visually selected text
  vnoremap c "+y
  vnoremap d "+d

"insert mode maps 

  "autocomplete with tab
  inoremap <Tab> <C-n>
  "k l navigation in autocomplete
  inoremap <expr> k pumvisible() ? "\<C-N>" : "k"
  inoremap <expr> l pumvisible() ? "\<C-P>" : "l"

  "way to go to normal mode
  inoremap mk <Esc>

"command mode maps

  "edit command mode history, executes last line with enter
  cnoremap <Space>e <C-f>

"custom commands
command! Sv execute "source ~/.vimrc"
command! G execute "!ghci %"
command! Cr execute "!path=$(pwd); cd /home/gnostis/Desktop/lambda-cases/haskell_generation; cabal run; cd $path"

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
