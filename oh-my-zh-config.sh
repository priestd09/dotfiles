plugins=(gitfast debian last-working-dir urltools ssh-agent colored-man bower nvm rvm ruby gem node npm themes zsh-syntax-highlighting vagrant)

alias ls='ls -X -h --group-directories-first --color'
alias gedit='subl'
alias g='git'
alias v='vagrant'

alias build-source='./configure && make && sudo make install'
alias untar='tar -zxvf'
alias untarxz='tar -xJf'

alias clean='sudo apt-get clean'
alias purge='sudo apt-get purge'
alias search='sudo apt-get search'
alias update='sudo apt-get update'
alias remove='sudo apt-get remove'
alias upgrade='sudo apt-get upgrade'
alias install='sudo apt-get install'
alias autoremove='sudo apt-get autoremove'
alias dist-upgrade='sudo apt-get dist-upgrade'

alias vu='cd  ~/Dropbox/Workspace/Homestead && vagrant up && cd -'
alias vm='ssh vagrant@127.0.0.1 -p 2222'

alias c='clear'

# Sudo alias fix
alias sudo='sudo '

function mkd() {
	mkdir -p "$@" && cd "$@"
}
 
function zombie() {
	ps aux | awk '{if ($8=="Z") { print $2 }}'
}
