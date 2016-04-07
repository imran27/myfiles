#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[ -r /etc/profile.d/cnf.sh ] && . /etc/profile.d/cnf.sh

export TERM=xterm-256color

## Settings for umask
if (( EUID == 0 )); then
	umask 002
else
	umask 022
fi

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

#PS1='\u@\h \W % '

shopt -s checkwinsize
shopt -s autocd

complete -cf sudo
complete -cf man

# Virtualenv support
function virtual_env_prompt () {
	REPLY=${VIRTUAL_ENV+(${VIRTUAL_ENV:t}) }
}

alias pseg='ps -e | grep -i'

alias pacin='sudo pacman -S'
alias pacout='sudo pacman -Rns'
alias pacupd='sudo pacman -Syu'
alias pacsr='pacman -Ss'
alias pacinf='pacman -Si'
alias cls='clear'
alias aria2c='aria2c -x16'
alias mkdir='mkdir -pv'
alias cp='cp -v'
alias rm='rm -v'
alias mv='mv -v'
alias reboot='systemctl reboot'
alias poweroff='systemctl poweroff'
alias rmorphans='sudo pacman -Rns $(pacman -Qqdt)'
alias ls='ls -hp --color=yes'
alias ICICILogin="midori -p ICICibank.com/safe-online-banking/safe-online-banking.page"

## install package from abs
function absin() {
	cur_dir=$PWD;
	abs_path=$(find /var/abs -type d -name $1);
	echo ABS Path of package is $abs_path;
	echo AURDEST=$AURDEST;
	sudo abs $(echo $abs_path | awk -F"/" '{print $4 "/" $5}');
	if [ ! -d "$AURDEST" ]
	then
		mkdir $AURDEST;
	fi
	cp -rf $abs_path $AURDEST;
	cd $AURDEST/$1;
	if [ $2 = "edit" ]
	then
		makepkg -sof;
		gvim -f $AURDEST/$1/PKGBUILD;
		makepkg -sricfe;
	else
		makepkg -sricf;
	fi
	cd $cur_dir;
}

function getaurpkg() {
	echo installing package $1
	cur_dir=$PWD;
	if [ -d $AURDEST/$1 ]
	then
		cd $AURDEST/$1;
		git pull;
	else
		git clone https://aur.archlinux.org/$1 $AURDEST/$1;
		cd $AURDEST/$1;
	fi
	makepkg -sricf;
	cd $cur_dir;
}


## Transparency for XTerm
[ -n "$XTERM_VERSION" ] && transset-df -a > /dev/null

## Google currency converter
function convert_currency() {
	wget -qO- "http://www.google.com/finance/converter?a=$1&from=$2&to=$3" |  sed '/res/!d;s/<[^>]*>//g';
}

#PS1='\u@\h \W % '

## powerline stuff
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
source /usr/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh

## BASH git prompt
GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_THEME=Default_Arch
source /usr/lib/bash-git-prompt/gitprompt.sh

## Screenfetch information
screenfetch
