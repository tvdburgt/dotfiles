#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# prompt prefix
#PS1='[\u@\h \W]\$ '
PS1='\[\e[32m\]\w\[\e[0m\] \[\e[31m\]\$\[\e[0m\] '

# Enable tab-completion using sudo and man
complete -cf sudo man

# Set up in separate file?
alias pip='wget http://checkip.dyndns.org/ -O - -o /dev/null | cut -d: -f 2 | cut -d\< -f 1'
alias ls='ls -F --color=auto'
alias rm='rm -Iv'
alias mv='mv -iv'
alias cp='cp -iv'
alias less='less -R'
alias pacman='sudo pacman-color'
alias pacorphans='pacman -Rs $(pacman -Qtdq)'


# Environment variables
export EDITOR=vim
export BROWSER=firefox
export PATH=$PATH:~/bin

eval $(dircolors -b ~/.lscolors)


# use netcfg instead for this
vpn() {
    [[ ! -f $1 ]] && echo "$1: no such file" && return

    sudo openvpn --daemon --cd $(dirname $1) --config $(basename $1)
}

manswitch() { man $1 | less -p "^ +$2"; }
translate() { wget -qO- "http://ajax.googleapis.com/ajax/services/language/translate?v=1.0&q=$1&langpair=$2|${3:-en}" | sed 's/.*"translatedText":"\([^"]*\)".*}/\1\n/'; }

google() {
    [[ -z "$BROWSER" ]] && return 1

    local term="${*:-$(xclip -o)}"

    $BROWSER "http://www.google.com/search?q=${term// /+}" &>/dev/null &
}

define() {

    local lang charset

    lang="${LANG%%_*}"
    charset="${LANG##*.}"

    lynx -accept_all_cookies \
         -dump \
         -hiddenlinks=ignore \
         -nonumbers \
         -assume_charset="$charset" \
         -display_charset="$charset" \
         "http://www.google.com/search?hl=$lang&q=define%3A+$1&btnG=Google+Search" \
         | grep -A 100 '^ 1\. ' | egrep '^ (1\.| ) '
}
