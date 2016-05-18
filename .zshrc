export TERM=xterm-256color

## Settings for umask
if (( EUID == 0 )); then
	umask 002
else
	umask 022
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd beep extendedglob nomatch notify NO_clobber printexitvalue interactivecomments histallowclobber
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit promptinit
compinit
promptinit
# End of lines added by compinstall

##################################################################################################################################################
## Color definitions for colored output using echo -e ############################################################################################
##################################################################################################################################################
export RCol='\e[0m'    # Text Reset

# Regular                    Bold                       Underline                  High Intensity             BoldHigh Intens            Background                 High Intensity Backgrounds
export Bla='\e[0;30m';     export BBla='\e[1;30m';    export UBla='\e[4;30m';    export IBla='\e[0;90m';    export BIBla='\e[1;90m';   export On_Bla='\e[40m';    export On_IBla='\e[0;100m';
export Red='\e[0;31m';     export BRed='\e[1;31m';    export URed='\e[4;31m';    export IRed='\e[0;91m';    export BIRed='\e[1;91m';   export On_Red='\e[41m';    export On_IRed='\e[0;101m';
export Gre='\e[0;32m';     export BGre='\e[1;32m';    export UGre='\e[4;32m';    export IGre='\e[0;92m';    export BIGre='\e[1;92m';   export On_Gre='\e[42m';    export On_IGre='\e[0;102m';
export Yel='\e[0;33m';     export BYel='\e[1;33m';    export UYel='\e[4;33m';    export IYel='\e[0;93m';    export BIYel='\e[1;93m';   export On_Yel='\e[43m';    export On_IYel='\e[0;103m';
export Blu='\e[0;34m';     export BBlu='\e[1;34m';    export UBlu='\e[4;34m';    export IBlu='\e[0;94m';    export BIBlu='\e[1;94m';   export On_Blu='\e[44m';    export On_IBlu='\e[0;104m';
export Pur='\e[0;35m';     export BPur='\e[1;35m';    export UPur='\e[4;35m';    export IPur='\e[0;95m';    export BIPur='\e[1;95m';   export On_Pur='\e[45m';    export On_IPur='\e[0;105m';
export Cya='\e[0;36m';     export BCya='\e[1;36m';    export UCya='\e[4;36m';    export ICya='\e[0;96m';    export BICya='\e[1;96m';   export On_Cya='\e[46m';    export On_ICya='\e[0;106m';
export Whi='\e[0;37m';     export BWhi='\e[1;37m';    export UWhi='\e[4;37m';    export IWhi='\e[0;97m';    export BIWhi='\e[1;97m';   export On_Whi='\e[47m';    export On_IWhi='\e[0;107m';
##################################################################################################################################################

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

alias pacin='sudo pacman -S --needed'
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
alias rmorphans='sudo pacman -Rns  $(pacman -Qqdt)'
alias ls='ls -hp --color=auto'
alias ICICILogin='midori -p ICICibank.com/safe-online-banking/safe-online-banking.page'
alias lXlog='less /var/log/Xorg.0.log'
alias mesalibtool='libtool --finish /usr/lib /usr/lib/xorg/modules /usr/lib/xorg/modules/dri /usr/lib/xorg/modules/drivers /usr/lib/dri /usr/lib/bellagio /usr/lib/d3d'
alias aursearch='cower -s --rsort=votes'

function aur_repo_update() {
	repo-add -R -n -s -v /home/abs/packages/abs-aur.db /home/abs/packages/*.pkg.tar;
}

## Transparency for XTerm
[ -n "${XTERM_VERSION}" ] && transset-df -a > /dev/null

## Go to the pkgbuild directory of a package
function cdpkgb() {
	if [ -d "${AURDEST}/${1}" ]; then
		cd "${AURDEST}/${1}";
	else
		echo "PKGBUILD for ${1} not present in ${AURDEST}, get it using pkgbget ${1}";
	fi
}

## Google currency converter
function convert_currency() {
	wget -qO- "http://www.google.com/finance/converter?a="${1}"&from="${2}"&to="${3}"" |  sed '/res/!d;s/<[^>]*>//g';
}

function ytaplay() {
	mpv --no-video "https://www.youtube.com/watch?v=${1}";
}

function ytvplay() {
	mpv "https://www.youtube.com/watch?v=${1}";
}

function pkgbinf() {
	expac -S "${BIYel}Package\t\t:${RCol} %n\n${BIYel}Description\t:${RCol} %d\n${BIYel}Packager\t:${RCol} %p\n${BIYel}Validated By\t:${RCol} %V" ${1};
}

function pkgblinf() {
	expac -Q "${BIYel}Package\t\t${RCol}: %n\n${BIYel}Description\t${RCol}: %d\n${BIYel}Packager\t${RCol}: %p\n${BIYel}Validated By\t${RCol}: %V" ${1};
}

function installdeps() {
	sudo pacman -S $(expac -S "%D" ${@});
}

## Source Zsh Syntax Highlighting
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-autopair/autopair.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

powerline-daemon -q
source /usr/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh
source /usr/share/autojump/autojump.zsh

## Screenfetch, screenshot of system info
#screenfetch

