# ---B--------------B---------------------------------------B--------------B--- #
# ---------------------- SSSSSSS AAAAAAA GGGGGGG EEEEEEE ---------------------- #
# ---A--------------A--- S       A     A G       E       ---A--------------A--- #
# ---------------------- SSSSSSS AAAAAAA GGGGGGG EEEEEEE ---------------------- #
# ---S--------------S---       S A     A G     G E       ---S--------------S--- #
# ---------------------- SSSSSSS A     A GGGGGGG EEEEEEE ---------------------- #
# ---H--------------H---------------------------------------H--------------H--- #

# ------ CONTENTS ------ #
# 1. Prompt
# 2. Config
# 3. Layout
# 4. Aliases
# 5. Functions
# 6. Exports
# -----------------------#

# ----------------------------------------------------------------------------- #
# -------------------------------- P R O M P T -------------------------------- #
# ----------------------------------------------------------------------------- #

gb () {
  git branch 2> /dev/null | sed -e 's/* \(.*\)/ ⑂ \1 /'
}
gl () {
  git log --oneline -n 1 2> /dev/null | sed -e 's/\(.*\)/✎ \1 /'
}
ARROW='▶ '
HOURGLASS='⧖'
COMPASS='✧'
WHITE_ON_CYAN='\e[6;37;46m'
WHITE_ON_GOLD='\e[5;37;43m'
GREY_ON_WHITE='\e[1;32;47m'
RESET='\e[0m'
export PS1="\n\[$WHITE_ON_GOLD\] \[$HOURGLASS\] \d \t \[$HOURGLASS\] \[$WHITE_ON_CYAN\] \[$COMPASS\] \w \[$COMPASS\] \[$GREY_ON_WHITE\]\$(gb)\$(gl)\n\[$WHITE_ON_CYAN\] \! \$ \[$RESET\] "

# ----------------------------------------------------------------------------- #
# -------------------------------- C O N F I G -------------------------------- #
# ----------------------------------------------------------------------------- #

export LANG=en_US.UTF-8 # Set Locale
set -o vi               # Turn vi mode on
export CLICOLOR=1       # Colors for ls

# ----------------------------------------------------------------------------- #
# -------------------------------- L A Y O U T -------------------------------- #
# ----------------------------------------------------------------------------- #

# -> HOME <- #
mkdir -p ~/Documents
mkdir -p ~/Downloads
mkdir -p ~/Pictures
mkdir -p ~/Videos
mkdir -p ~/Graphics
mkdir -p ~/Code/pkg
mkdir -p ~/Code/bin
mkdir -p ~/Code/src/github.com/ericsage

# -> VIM <-#
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/tmp
mkdir -p ~/.vim/undo

# ----------------------------------------------------------------------------- #
# ------------------------------- A L I A S E S ------------------------------- #
# ----------------------------------------------------------------------------- #

# -> MOVEMENT <- #
alias ~='cd ~'
alias ..='cd ../'
alias ...='cd ../../'

alias doc='cd ~/Documents'
alias documents='cd ~/Documents'

alias dow='cd ~/Downloads'
alias downloads='cd ~/Downloads'

alias pic='cd ~/Pictures'
alias pictures='cd ~/Pictures'

alias vid='cd ~/Videos'
alias videos='cd ~/Videos'

alias mus='cd ~/Music'
alias music='cd ~/Music'

alias gra='cd ~/Graphics'
alias graphics='cd ~/Graphics'

alias c='cd ~/Code/src/github.com/ericsage'
alias code='cd ~/Code/src/github.com/ericsage'
alias CODE='cd ~/Code/src/github.com/ericsage'

# -> VIM <- #
alias v='vim'
alias vi='vim'

# -> GIT <- #
alias g="git"

# -> DOTFILES <- #
alias evi='vim ~/.vimrc'
alias ebash='vim ~/.bash_profile'
alias egit='vim ~/.gitconfig'

# -> TMUX <- #
alias t='tmux -u2'
alias tmux='tmux -u2'
alias tn='tmux new -s'
alias ta='tmux attach -t'
alias ts='tmux switch -t'
alias twn='tmux new-window'
alias tws='tmux select-window'
alias tv='tmux split-window'
alias th='tmux split-window -h'
alias tl='tmux list-sessions'

# -> DOCKER <- #
alias d='docker'
alias dc='docker-compose'
alias dm='docker-machine'

# -> KUBERNETES <- #
alias k='kubectl'


# ----------------------------------------------------------------------------- #
# ----------------------------- F U N C T I O N S ----------------------------- #
# ----------------------------------------------------------------------------- #

# ----------------------------------------------- #
# -> dkill: Kill and remove a container <- #
dkill () { eval "$(docker kill $1 && docker rm $1)" ; }
# ----------------------------------------------- #

# ----------------------------------------------- #
# -> mans: Search manpage from first argument for term in second argument <- #
mans () { man $1 | grep -iC2 --color=always $2 | less ; }
# ----------------------------------------------- #

# ----------------------------------------------- #
# -> httpHeaders: Grabs headers from web page <- #
httpHeaders () { /usr/bin/curl -I -L $@ ; }
# ----------------------------------------------- #

# ----------------------------------------------- #
# -> httpDebug: Download a web page and show info on what took time <- #
httpDebug () { /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n" ; }
# ----------------------------------------------- #

# ----------------------------------------------------------------------------- #
# ------------------------------- E X P O R T S ------------------------------- #
# ----------------------------------------------------------------------------- #

export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export GOROOT=/usr/bin/go
export GOPATH=/root/Code
export PATH=$PATH:$HOME/Code/bin:/usr/bin/go/bin

# ----------------------------------------------------------------------------- #
