source $ZSH/oh-my-zsh.sh

alias homestead="/home/xuma/.composer/vendor/bin/homestead"
alias vu="homestead up"
alias vm="homestead ssh"
alias vs="homestead suspend"
alias ls='ls -X -h --group-directories-first --color'
alias gedit='subl'
alias g='git'
alias a='git add .'
alias p:o='git push -u origin master'
alias p:s='git push -u origin stage'
alias s='git status'
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
alias git-discard='git clean -df; git checkout -- .'
alias sudo='sudo '
alias laravel5='composer create-project laravel/laravel .  dev-develop --prefer-dist'

function c(){
	git commit -m "$@"
}

function serve(){
	php -S localhost:"$@"
}

#dont forget to set :  git config --global push.default matching
function gitall()
{
	git add -A 
	git commit -m "$@"
	git push
}

function mkd() {
	mkdir -p "$@" && cd "$@"
}
 
function zombie() {
	ps aux | awk '{if ($8=="Z") { print $2 }}'
}

# Symfony create bundle
function s:cb(){
	php app/console generate:bundle --namespace=$@ --format=yml
}
