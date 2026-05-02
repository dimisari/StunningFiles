# now
alias bam="cd $HOME/Desktop/lambda-cases/src/; vim ASTTypes.hs"

# configs
bashFile="$HOME/.bashrc"
alias vb="vim $bashFile"
alias vba="vim $HOME/.bash_aliases"
alias vv="vim $HOME/.vimrc"
alias vi3="vim $HOME/.config/i3/config"
alias vi="vim $HOME/.inputrc"
alias sb="source $bashFile"

# git
alias gst="git status"
alias gpl="git pull"
alias gps="git push"
alias gbr="git branch"
alias gch="git checkout"
alias gco="git commit"
alias gdi="git diff"
alias glo="git log"

#  commands in short
alias m="make"
alias mc="make clean"
alias mt="make test"
alias ..="cd .."
alias gr="grep -rnI"
alias sai="sudo apt install"
alias sapt="sudo apt"
alias clipboard="xclip -selection clipboard"

# haskell
alias cb="cabal build"
alias cr="cabal run"
alias cblib="cabal install --lib"
alias ghci="ghci -XLambdaCase"
alias ghc="ghc -no-keep-hi-files -no-keep-o-files"

# docker
alias dps="docker ps"
alias dims="docker images"
alias drmi="docker image rm -f"
alias db="docker build . -t"
alias dr="docker run"
alias dk="docker kill"
alias dcb="docker-compose build"
alias dcu="docker-compose up"
alias dck="docker-compose kill"

# stay in same dir after ranger exit
alias r="ranger --choosedir=$HOME/.rangerdir; cd \"\`cat $HOME/.rangerdir\`\""
alias ρ="ranger --choosedir=$HOME/.rangerdir; cd \"\`cat $HOME/.rangerdir\`\""

# help scripts
helpScripts="$HOME/StunningFiles/Scripts"
alias temp="$helpScripts/copy_template.sh"
alias dirr="runhaskell $helpScripts/replace_in_dir.hs"
alias inv="$helpScripts/in_vim.sh"

# arduino
alias ard="sudo chmod a+rw /dev/ttyUSB0"

