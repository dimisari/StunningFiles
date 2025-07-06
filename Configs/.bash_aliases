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
alias gcl="git clone"
alias gbr="git branch"
alias gch="git checkout"
alias gco="git commit"
alias gdi="git diff"
alias glo="git log"

#  commands in short
alias h="cd $HOME"
alias m="make"
alias mr="make > make_result"
alias mc="make clean"
alias mc_="make clean_"
alias ..="cd .."
alias gr="grep -rnI"
alias sai="sudo apt install"
alias sapt="sudo apt"

# haskell
alias cb="cabal build"
alias cr="cabal run"
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
alias dirr="$helpScripts/replace_in_dir.sh"
alias inv="$helpScripts/in_vim.sh"

# arduino
alias ard="sudo chmod a+rw /dev/ttyUSB0"

# todo
alias todo="cat $HOME/Desktop/Stuff/Todo/Next"
alias todovim="vim $HOME/Desktop/Stuff/Todo/Next"
alias sched="cat $HOME/Desktop/Stuff/Schedule"
alias schedvim="vim $HOME/Desktop/Stuff/Schedule"

