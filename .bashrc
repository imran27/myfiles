#
# ~/.bashrc
#

if [ -r /etc/profile.d/cnf.sh ]; then
	. /etc/profile.d/cnf.sh
fi

## Don't do anything for non-interactive shells
if [[ $- != *i* ]]; then
	return;
fi

export TERM=xterm-256color

## Settings for umask
if [ $(id -u) != 0 ]; then
	umask 022
else
	umask 002
fi

HISTFILE="${HOME}/.bash_hist"
HISTSIZE=10000
SAVEHIST=10000

#PS1='\u@\h \W % '

shopt -s checkwinsize
shopt -s autocd
shopt -s extglob

complete -cf sudo
complete -cf man

## Useful aliases

alias pseg='ps -e | grep -i'

if [ $(id -u) != 0 ]; then
	alias pacin='pacaur -S --noedit'
	alias pacout='sudo pacman -Rns'
	alias pacupd='pacaur -Syu --noedit'
	alias rmorphans='sudo pacman -Rns $(pacman -Qqdt)'
else
	alias pacin='pacman -S'
	alias pacout='pacman -Rns'
	alias pacupd='pacman -Syu'
	alias rmorphans='pacman -Rns $(pacman -Qqdt)'
fi

alias ls='ls -hp --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias pacsr='pacaur -Ss'
alias pacinf='pacaur -Si'
alias cls='clear'
alias aria2c='aria2c -x16'
alias mkdir='mkdir -pv'
alias cp='cp -v'
alias rm='rm -v'
alias mv='mv -v'
alias reboot='systemctl reboot'
alias poweroff='systemctl poweroff'
alias ICICILogin="midori -p ICICibank.com/safe-online-banking/safe-online-banking.page"

## Transparency for XTerm
if [ -n "${XTERM_VERSION}" ]; then
	transset-df -a > /dev/null
fi

## Go to the pkgbuild directory of a package
cdpkgb() {
	if [ -d "${AURDEST}/${1}" ]; then
		cd "${AURDEST}/${1}";
	else
		echo "PKGBUILD for ${1} not present in ${AURDEST}, get it using pkgbget ${1}";
	fi
}

## Google currency converter
convert_currency() {
	wget -qO- "http://www.google.com/finance/converter?a="${1}"&from="${2}"&to="${3}"" |  sed '/res/!d;s/<[^>]*>//g';
}

ytaplay() {
	mpv --no-video "https://www.youtube.com/watch?v=${1}";
}

ytvplay() {
	mpv "https://www.youtube.com/watch?v=${1}";
}

pkgbinf() {
	expac -S "${BIYel}Package\t\t:${RCol} %n\n${BIYel}Description\t:${RCol} %d\n${BIYel}Packager\t:${RCol} %p\n${BIYel}Validated By\t:${RCol} %V" ${1};
}

pkgblinf() {
	expac -Q "${BIYel}Package\t\t${RCol}: %n\n${BIYel}Description\t${RCol}: %d\n${BIYel}Packager\t${RCol}: %p\n${BIYel}Validated By\t${RCol}: %V" ${1};
}

installdeps() {
	if [ $(id -u) != 0 ]; then
		sudo pacman -S $(expac -S "%D" ${@});
	else
		pacman -S $(expac -S "%D" ${@});
	fi
}

## Google currency converter
convert_currency() {
	wget -qO- "http://www.google.com/finance/converter?a=$1&from=$2&to=$3" |  sed '/res/!d;s/<[^>]*>//g';
}

#[ -r /usr/share/gentoo-bashrc/bashrc ] && . /usr/share/gentoo-bashrc/bashrc;

export PS1="\n${IRed}${On_Yel}[${Whi}${On_Yel}\$?${IRed}${On_Yel}] ${IRed}${On_Yel}[${Whi}${On_Yel}\$(date)${IRed}${On_Yel}]${RCol}\n${On_Yel}>>${RCol} "

if [ $(id -u) != 0 ]; then
	PS1+="${UIYel}\u${IYel}@\h${IBlu} \w \$${RCol} "
else
	PS1+="${UIRed}\h${IBlu} \W #${RCol} "
fi
