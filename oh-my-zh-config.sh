export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git)
export PATH="/home/xuma/.rvm/gems/ruby-2.1.3/bin:/home/xuma/.rvm/gems/ruby-2.1.3@global/bin:/home/xuma/.rvm/rubies/ruby-2.1.3/bin:/home/xuma/.rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
source $ZSH/oh-my-zsh.sh
alias vu="homestead up"
alias vm="homestead ssh"
alias vs="homestead suspend"
alias ls='ls -X -h --group-directories-first --color'
alias gedit='subl'
alias g='git'
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
alias c='clear'
alias sudo='sudo '
alias laravel5='composer create-project laravel/laravel .  dev-develop --prefer-dist'
function mkd() {
	mkdir -p "$@" && cd "$@"
}
 
function zombie() {
	ps aux | awk '{if ($8=="Z") { print $2 }}'
}
