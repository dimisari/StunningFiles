" make leftmost column some beautiful color +
" column 80 red (and scary. don't go)
set foldcolumn=1
highlight FoldColumn ctermbg=6
set colorcolumn=80

" searh options:
"   _h_igh_l_ight _search_ + while typing the search (_inc_rementally)
set hlsearch incsearch
"   _case_ insensitive (_ignore_) +
"   become case sensitive in capital letters (_smart_)
set ignorecase smartcase

" self explanatory and awesome
set autoindent

" tab options:
"   it is 2 spaces + make it actual spaces (_expand_) +
"   auto _shift(width)_ (e.g. inside multiline paren expr) is also 2 spaces
set tabstop=2 expandtab shiftwidth=2

" start _scroll_ing 10 lines (_off_set) before hitting any edge
" because why would you want your cursor that far
set scrolloff=10

" _show_ where a line is broken(_break_) because of hugeness
" with "--->" as the 4 first chars (cannot be reached by cursor)
set showbreak=--->

" _show_ number of selected characters in visual mode
"   (among other things it seems)
set showcmd

" disable swap files (saved my life)
set noswapfile

" You'll probably need -> :help key-notation

" If system clipboard copy and paste don't work: sudo apt intall vim-gtk
"   (if not in debian-based distro figure it out by yourself)

" Always noremap so that I don't use macros inside macros and
"   confuse myself I guess

" general maps (I believe that means normal + visual mode)

  " left/down/up/right for normal people
  "   that follow the standard typing guidelines
  noremap j h
  noremap k j
  noremap l k
  noremap ; l

  " _s_earch
  noremap s /
  " x: delete and get into insert mode (deletes cursor char in normal mode)
  noremap x s

  " go to first char of line
  noremap <Space>j ^
  " go to last char of line
  noremap <Space>; $h
  " toggle between opening and closing in all brackets
  noremap zj %

  " LOVE these
  "   next/previous search match + center cursor vertically
  noremap n nzz
  noremap N Nzz
  "   paragraph down/up (next/previous empty line) + center cursor vertically
  noremap K }zz
  noremap L {zz
  "   half page down/up + center cursor vertically
  noremap <C-k> <C-d>zz
  noremap <C-l> <C-u>zz

  " down/up for huge lines that are broken
  "   (better to use gq to fix them but just in case)
  noremap gk gj
  noremap gl gk

" normal mode maps

  " _c_opy line into system clipboard
  nnoremap c "+yy
  " _C_opy word into system clipboard
  nnoremap C viW"+y

  " _D_elete line (into system clipboard)
  nnoremap D "+dd

  " _d_elete single character (into system clipboard)
  nnoremap d "+x

  " _r_eplace all occurences of word under cursor with ...
  nnoremap r :%s/\<<C-r><C-w>\>//g<Left><Left>

  " remove search highlighting
  nnoremap h :noh<CR>

  " _p/P_aste after/at cursor from clipboard
  nnoremap p "+p
  nnoremap P "+P

  " _s_earch word under cursor + center cursor vertically
  nnoremap <Space>s *Nzz

  " _S_earch Word under cursor + center cursor vertically
  nnoremap S viWy/\V<C-R>=escape(@",'/\')<CR><CR>N

  " delete Word and get into insert mode
  nnoremap X viWs

  " save
  nnoremap <Space>z :w<CR>

  " _q_uit (without saving)
  nnoremap <Space>q :q!<CR>

  " add space at/after cursor
  nnoremap <Space>i i<Space><Esc>
  nnoremap <Space>a a<Space><Esc>

  " add empty line above/below cursor
  nnoremap <Space>O O<Esc>j
  nnoremap <Space>o o<Esc>k

  " (add tab/remove tab) at cursor
  nnoremap <Space>> <C-v>>
  nnoremap <Space>< <C-v><

  " space + c + letter => copy line to register with that letter
  nnoremap <expr> <Space>c "\"" . nr2char(getchar()) . "yy"

  " space + p/P + letter
  "   => _p/P_aste from register with that letter: after/at cursor
  nnoremap <expr> <Space>p "\"" . nr2char(getchar()) . "p"
  nnoremap <expr> <Space>P "\"" . nr2char(getchar()) . "P"

  " find character with f + char (does it with search so that n/N can be used)
  nnoremap <expr> f "/" . CharOfSearch() . "<CR>:noh<CR>"
  " same starts from previous occurence
  nnoremap <expr> F "/" . CharOfSearch() . "<CR>N:noh<CR>"

  " enclose Word in () [] {} <> "" ''
  nnoremap <Space>ep viWs(<c-r>")<Esc>%
  nnoremap <Space>es viWs[<c-r>"]<Esc>%
  nnoremap <Space>eb viWs{<c-r>"}<Esc>%
  nnoremap <Space>e< viWs<<c-r>"><Esc>
  nnoremap <Space>e" viWs"<c-r>""<Esc>
  nnoremap <Space>e' viWs'<c-r>"'<Esc>
  nnoremap <Space>e\| viWs\|<c-r>"\|<Esc>

  " edit file under cursor
  nnoremap <Space>f :w<CR>gf
  " In most files I have a few lines with all the other files I usually switch
  " to from there. I use this to switch fast. It's usually a commented area
  " at the bottom of the file so that I can combine it in with G.

  " run command under cursor and print output underneath
  nnoremap <Space>r 0v$h"cy:r!<C-r>c<CR>

  " increase/decrease int
  nnoremap <Space>mi <C-a>
  nnoremap <Space>md <C-x>

  " select all
  nnoremap <C-a> ggVG

  " stop recording
  nnoremap <C-j> q

  " (vim) help on the word under the cursor
  nnoremap <Space>H K

  " latex maps
    " reload pdf
    nnoremap R :w<CR> :! pdflatex -output-directory Pdf %<CR><CR>

  " run make
  nnoremap M :w<CR> :! make<CR><CR>

" visual mode maps

  " replace all occurences of visually selected text
  vnoremap r "hy:%s/<C-r>h//g<Left><Left>

  " search visually selected text
  vnoremap <Space>s y/\V<C-R>=escape(@",'/\')<CR><CR>N

  " replace something inside only inside the viusally selected text
  vnoremap <Space>r :s//g<Left><Left>

  " go to normal mode
  vnoremap <C-j> <Esc><Esc>

  " space at cursor column (used in visual block for multiple lines)
  vnoremap <Space>i I<Space><Esc>

  " copy/delete visually selected text
  vnoremap c "+y
  vnoremap d "+d

  " space + c + letter => copy visually selected text to register with that letter
  vnoremap <expr> <Space>c "\"" . nr2char(getchar()) . "y"

  " enclose visually selected text in () [] {} <> "" ''
  vnoremap <Space>ep s(<c-r>")<Esc>%
  vnoremap <Space>es s[<c-r>"]<Esc>%
  vnoremap <Space>eb s{<c-r>"}<Esc>%
  vnoremap <Space>e< s<<c-r>"><Esc>
  vnoremap <Space>e" s"<c-r>""<Esc>
  vnoremap <Space>e' s'<c-r>"'<Esc>
  vnoremap <Space>e\| s\|<c-r>"\|<Esc>

  " select all text inside () [] {} || line
  vnoremap ip ib
  vnoremap is i[
  vnoremap ib i{
  vnoremap i\| <Esc>F\|lvf\|h
  vnoremap il <Esc>^v$h

  " select all text inside and including () [] {}
  vnoremap ap ab
  vnoremap as a[
  vnoremap ab a{

  " _p_aste on top of selected text
  vnoremap p "+p
  " space + p + letter: same but for the contents of a register
  vnoremap <expr> <Space>p "\"" . nr2char(getchar()) . "p"

  " find character with f + char (does it with search so that n/N can be used)
  vnoremap <expr> f "/" . CharOfSearch() . "<CR>"
  " same but beginning at the previous instance instead of the next
  vnoremap <expr> F "/" . CharOfSearch() . "<CR>N"

  " latex
    " enclose visually selected text in begin-end block
    vnoremap <Space>be "vdi\begin{__}<CR>\end{__}<CR><Esc>kk"vp/__<CR>N

" insert mode maps

  " autocomplete with tab
  inoremap <Tab> <C-n>
  " k l navigation in autocomplete
  inoremap <expr> k pumvisible() ? "\<C-N>" : "k"
  inoremap <expr> l pumvisible() ? "\<C-P>" : "l"

  " κ λ navigation in autocomplete
  inoremap <expr> κ pumvisible() ? "\<C-N>" : "κ"
  inoremap <expr> λ pumvisible() ? "\<C-P>" : "λ"

  " open and close automatically () [] {} <> "" ''
  inoremap ( ()<Esc>i
  inoremap [ []<Esc>i
  inoremap { {}<Esc>i
  inoremap < <><Esc>i
  inoremap " ""<Esc>i
  inoremap ' ''<Esc>i

  " go to normal mode
  inoremap <expr> <C-j> "<Esc>" . (reg_recording() == "v" ? "q" : "")

" command mode maps

  " go to previous/next in searches or commands
  cnoremap <C-l> <C-p>
  cnoremap <C-k> <C-n>

  " paste in command mode
  cnoremap <C-p> <C-r>+

" custom commands
  " make
  command M !make
  " run current (script) file
  command R !./%
  " Open files
  command F e ~/.files
  " Add file to ~/.files with nickname
  command -nargs=1 AddFile
    \ execute "!echo " . shellescape(NicknameAndPathLine(<f-args>)) .
    \ " >> ~/.files"
  " Preview markdown
  command MD !pandoc % | lynx -stdin


  " vimrc
    " comment visually selected lines
    command -range CV '<,'> norm I"<Del> <Esc>
    " uncomment visually selected lines
    command -range UV '<,'> norm ^v;d

    " source
    command SV source ~/.vimrc | noh

  " Haskell
    " comment visually selected lines
    command -range CH '<,'> norm I-- <Esc>
    " uncomment visually selected lines
    command -range UH '<,'> norm ^v;;d

    " form of common stuff
    " value
    command -nargs=1 Hval
      \ call PrintHaskellValue(<f-args>) | execute "norm ll/__<CR>"
    " data
    command -nargs=1 Hdata
      \ call PrintHaskellData(<f-args>) | execute "norm l/__<CR>"
    " type
    command -nargs=1 Htype
      \ call PrintHaskellType(<f-args>) | execute "norm /__<CR>"
    " class
    command -nargs=1 Hclass
      \ call PrintHaskellClass(<f-args>) | execute "norm /__<CR>"
    " instance
    command -nargs=1 Hinst
      \ call PrintHaskellInstance(<f-args>) | execute "norm /__<CR>"

    " save + load current file in ghci
    command G execute "w | !ghci -XLambdaCase %"
    " save + load current file in ghci from .. as base for imports
    command GL execute
      \ "w | !file=$(basename $(pwd))/%; cd ..; ghci -XLambdaCase $file"

  " Latex
    " comment visually selected lines
    command -range LC '<,'> norm I% <Esc>
    " uncomment visually selected lines
    command -range LU '<,'> norm ^v;d

    " textit
    command Ltit norm i\textit{
    " texttt
    command Lttt norm i\texttt{
    " textbf
    command Ltbf norm i\textbf{
    " \verb
    command Lverb norm i\verb||
    " \begin - end
    " command Lbegin execute
      " \ "norm o\\begin{__<Esc>o\\end{__<Esc><Space>oO<CR>\\item<CR><Esc>" .
      " \ "{{/__<CR>"
    command -nargs=1 Lbegin
      \ call PrintBeginEndBlock(<f-args>) | execute "norm lll<CR>"


    " enclose textit
    command Letit norm viW<Space>ebi\textit<Esc>:noh<CR>E
    " enclose texttt
    command Lettt norm viW<Space>ebi\texttt<Esc>:noh<CR>E
    " enclose textbf
    command Letbf norm viW<Space>ebi\textbf<Esc>:noh<CR>E
    " enclose verb
    command Leverb norm viW<Space>e|Bi\verb<Esc>:noh<CR>E

  " Bash
    " comment visually selected lines
    command -range CB '<,'> norm I# <Esc>
    " uncomment visually selected lines
    command -range UB '<,'> norm ^v;d

  " Python
    " comment visually selected lines
    command -range CP '<,'> norm I# <Esc>
    " uncomment visually selected lines
    command -range UP '<,'> norm ^v;d

  " C
    " comment visually selected lines
    command -range CC '<,'> norm I// <Esc>
    " uncomment visually selected lines
    command -range UC '<,'> norm ^v;;d
    command SCC /\/\/

" Functions
function CharOfSearch()
return escape(nr2char(getchar()), "./$")
endfunction

function NicknameAndPathLine(nickname)
return a:nickname . " " . expand('%:p')
endfunction

  " Haskell
    " value
    function HaskellValue(value_name)
    return a:value_name . " :: __\n" . a:value_name . " = __\n\n"
    endfunction

    function PrintHaskellValue(value_name)
    let a=HaskellValue(a:value_name)
    put =a
    endfunction

    " data
    function HaskellData(data_name)
    return "data " . a:data_name . " =\n  __ | __\n\n"
    endfunction

    function PrintHaskellData(data_name)
    let a=HaskellData(a:data_name)
    put =a
    endfunction

    " type
    function HaskellType(type_name)
    return "type " . a:type_name . " = __ \n\n"
    endfunction

    function PrintHaskellType(type_name)
    let a=HaskellType(a:type_name)
    put =a
    endfunction

    " class
    function HaskellClass(class_name)
    return "class " . a:class_name . " where\n  __ :: __\n\n"
    endfunction

    function PrintHaskellClass(class_name)
    let a=HaskellClass(a:class_name)
    put =a
    endfunction

    " instance
    function HaskellInstance(instance_name)
    return "instance " . a:instance_name . " where\n  __ = __\n\n"
    endfunction

    function PrintHaskellInstance(instance_name)
    let a=HaskellInstance(a:instance_name)
    put =a
    endfunction

  " Latex
    " begin-end block
    function BeginEndBlock(block_type)
    return "\\begin{" . a:block_type . "}\n\n\\end{" . a:block_type . "}\n\n"
    endfunction

    function PrintBeginEndBlock(block_type)
    let a=BeginEndBlock(a:block_type)
    put =a
    endfunction

" encoding
set encoding=utf-8
" syntax highlihting
syntax on
" autocomplete in command mode (it helps, not really sure how though :p)
set wildmode=full

" enable K (which is mapped to <Space>h above)
" for help about word under cursor in vimrc
autocmd BufRead ~/.vimrc setlocal keywordprg=:help

" regular tab for Makefile
autocmd BufRead */Makefile set noexpandtab

" remove all whitespace before end of line
"   because if there is an empty line with space jumping paragraphs doens't work
"   properly and it's very annoying
autocmd BufWritePre * :%s/\s\+$//e
