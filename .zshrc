#
# ~/.zshrc
#

## Don't do anything for non-interactive shells
if [[ $- != *i* ]]; then
    return;
fi

export TERM=xterm-256color

## Settings for umask
if [[ $(id -u) == 0 ]]; then
    umask 002
else
    umask 022
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
HISTDUP=erase
setopt appendhistory autocd beep extendedglob nomatch notify NO_clobber printexitvalue interactivecomments histallowclobber
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "${HOME}/.zshrc"

autoload -Uz compinit promptinit colors
compinit
promptinit
colors
# End of lines added by compinstall

#prompt adam2

## Useful aliases

alias -g '...'='../..'
alias -g '....'='../../..'
alias -g BG='& exit'
alias -g C='|wc -l'
alias -g G='|grep'
alias -g H='|head'
alias -g Hl=' --help |& less -r'
alias -g K='|keep'
alias -g L='|less'
alias -g LL='|& less -r'
alias -g M='|most'
alias -g N='&>/dev/null'
alias -g R='| tr A-z N-za-m'
alias -g SL='| sort | less'
alias -g S='| sort'
alias -g T='|tail'
alias -g V='| vim -'

alias pseg='ps -e | grep -i'

if [ $(id -u) != 0 ]; then
    alias pacin='pacaur -S --noedit'
    alias pacout='sudo pacman -Rns'
    alias pacupd='pacaur -Syu --noedit'
    alias rmorphans='sudo pacman -Rns $(pacman -Qqdt)'
    alias startdewm='startx ~/.xinitrc'
else
    alias pacin='pacman -S'
    alias pacout='pacman -Rns'
    alias pacupd='pacman -Syu'
    alias rmorphans='pacman -Rns $(pacman -Qqdt)'
fi

alias pacsr='pacaur -Ss'
alias pacinf='pacaur -Si'
alias cls='clear'
alias aria2c='aria2c -x16'
alias mkdir='mkdir -pv'
# alias cp='cp -v'
# alias rm='rm -v'
# alias mv='mv -v'
alias ls='ls -hp --color=auto'
alias ICICILogin='midori -p ICICibank.com/safe-online-banking/safe-online-banking.page'
alias lXlog='less /var/log/Xorg.0.log'
alias mesalibtool='libtool --finish /usr/lib /usr/lib/xorg/modules /usr/lib/xorg/modules/dri /usr/lib/xorg/modules/drivers /usr/lib/dri /usr/lib/bellagio /usr/lib/d3d'
alias aursearch='cower -s --rsort=votes'

alias poweroff='systemctl poweroff'
alias reboot='systemctl reboot'

aur_repo_update() {
    repo-add -R -n -s -v /home/abs/packages/abs-aur.db /home/abs/packages/*.pkg.tar;
}

## Transparency for XTerm
#[ -n "${XTERM_VERSION}" ] && transset-df -a > /dev/null

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

## Source Zsh Syntax Highlighting
[ -r /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && . /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -r /usr/share/zsh/plugins/zsh-autopair/autopair.zsh ] && . /usr/share/zsh/plugins/zsh-autopair/autopair.zsh
[ -r /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && . /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# powerline-daemon -q
# [ -r /usr/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh ] && . /usr/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh
[ -r /usr/share/autojump/autojump.zsh ] && . /usr/share/autojump/autojump.zsh
