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

## oh-my-zsh stuff
#ZSH=/usr/share/oh-my-zsh
#DISABLE_AUTO_UPDATE="true"
#ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
#plugins=(adb git svn)
#ZSH_THEME="powerline"
#source $ZSH/oh-my-zsh.sh

## Useful aliases

alias -g "..."="../.."
alias -g "...."="../../.."
alias -g BG="& exit"
alias -g C="|wc -l"
alias -g G="|grep"
alias -g H="|head"
alias -g Hl=" --help |& less -r"
alias -g K="|keep"
alias -g L="|less"
alias -g LL="|& less -r"
alias -g M="|most"
alias -g N="&>/dev/null"
alias -g R="| tr A-z N-za-m"
alias -g SL="| sort | less"
alias -g S="| sort"
alias -g T="|tail"
alias -g V="| vim -"

alias pseg='ps -e | grep -i'

alias pacin="pacaur -S --noedit --rebuild"
alias pacout="sudo pacman -Rns"
alias pacupd="pacaur -Syu --noedit"
alias pacsr="pacaur -Ss"
alias pacinf="pacaur -Si"
alias cls="clear"
alias aria2c="aria2c -x16"
alias mkdir="mkdir -pv"
alias cp="cp -v"
alias rm="rm -v"
alias mv="mv -v"
alias reboot="systemctl reboot"
alias poweroff="systemctl poweroff"
alias rmorphans="sudo pacman -Rns $(pacman -Qqdt)"
alias ls="ls -hp --color=yes"
alias ICICILogin="midori -p ICICibank.com/safe-online-banking/safe-online-banking.page"
alias lXlog="less /var/log/Xorg.0.log"

## Transparency for XTerm
[ -n "${XTERM_VERSION}" ] && transset-df -a > /dev/null

## Google currency converter
function convert_currency() {
	wget -qO- "http://www.google.com/finance/converter?a="${1}"&from="${2}"&to="${3}"" |  sed '/res/!d;s/<[^>]*>//g';
}

## Source Zsh Syntax Highlighting
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-dwim/init.zsh
source /usr/share/zsh/plugins/zsh-autopair/autopair.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

powerline-daemon -q
source /usr/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh

## Screenfetch, screenshot of system info
screenfetch
