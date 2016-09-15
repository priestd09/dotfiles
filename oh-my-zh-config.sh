source $ZSH/oh-my-zsh.sh

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
alias clean='sudo apt clean'
alias purge='sudo apt purge'
alias search='sudo apt search'
alias update='sudo apt update'
alias remove='sudo apt remove'
alias upgrade='sudo apt upgrade'
alias install='sudo apt install'
alias autoremove='sudo apt autoremove'
alias dist-upgrade='sudo apt dist-upgrade'
alias git-discard='git clean -df; git checkout -- .'
alias sudo='sudo '
alias art='php artisan'
alias laravel5='composer create-project laravel/laravel .  dev-develop --prefer-dist'

#sudo apt-get install youtube-dl
function ydl()
{
	youtube-dl --extract-audio --audio-format mp3 "$@" --ignore-errors 
}

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
#add .gitignore after project
function addignore(){
	git rm -r --cached .
	git add .
	git commit -m ".gitignore is now working"
}
function mkd() {
	mkdir -p "$@" && cd "$@"
}
 
function zombie() {
	ps aux | awk '{if ($8=="Z") { print $2 }}'
}

