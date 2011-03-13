NOCOLOR=1

export PATH=~/.cw/def:$PATH:/usr/local:/usr/local/sbin:/usr/sbin:/sbin
export EDITOR="vim"
#export TERM="xterm"

OS=$(uname)

autoload colors
colors

setopt prompt_subst
 
alias -g  HE='2>>( sed -ue "s/.*/$fg_bold[red]&$reset_color/" 1>&2 )'
eval `dircolors`

source /etc/profile

source ~/.zsh_key
source ~/.zsh_aliase
source ~/.zsh_function

unlimit
limit stack 1024
limit core 0
limit -s
umask 022

cdpath=( . ~ )

READNULLCMD=${PAGER}

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;33' 

[[ -x $(whence -p most) ]] && export PAGER=$(whence -p most)
export OOO_FORCE_DESKTOP=gnome
export LESSCHARSET=UTF-8
export LS_COLORS='no=00;37:fi=00;37:di=01;36:ln=04;36:pi=33:so=01;35:do=01;35:bd=33;01:cd=33;01:or=31;01:su=37:sg=30:tw=30:ow=34:st=37:ex=01;31:*.cmd=01;31:*.exe=01;31:*.com=01;31:*.btm=01;31:*.sh=01;31:*.run=01;31:*.tar=33:*.tgz=33:*.arj=33:*.taz=33:*.lzh=33:*.zip=33:*.z=33:*.Z=33:*.gz=33:*.bz2=33:*.deb=33:*.rpm=33:*.jar=33:*.rar=33:*.jpg=32:*.jpeg=32:*.gif=32:*.bmp=32:*.pbm=32:*.pgm=32:*.ppm=32:*.tga=32:*.xbm=32:*.xpm=32:*.tif=32:*.tiff=32:*.png=32:*.mov=34:*.mpg=34:*.mpeg=34:*.avi=34:*.fli=34:*.flv=34:*.3gp=34:*.mp4=34:*.divx=34:*.gl=32:*.dl=32:*.xcf=32:*.xwd=32:*.flac=35:*.mp3=35:*.mpc=35:*.ogg=35:*.wav=35:*.m3u=35:';
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

setenv() { typeset -x "${1}${1:+=}${(@)argv[2,$#]}" }
#freload() { while (( $# )); do; unfunction $1; autoload -U $1; shift; done }

zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'
zstyle ':completion:*:expand:*' tag-order all-expansions
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~''*?.old' '*?.pro'
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*' menu yes select

HISTFILE=~/.zhistory
SAVEHIST=5000
setopt NO_BEEP
setopt AUTO_CD
#setopt CORRECT_ALL
setopt INTERACTIVECOMMENTS
setopt SH_WORD_SPLIT

setopt histexpiredupsfirst histfindnodups histignoredups
setopt appendhistory histnostore histverify histignorespace extended_history share_history

setopt notify pushdtohome cdablevars autolist
setopt autocd longlistjobs
setopt autoresume pushdsilent noclobber
setopt autopushd pushdminus extendedglob rcquotes mailwarning
unsetopt bgnice autoparamslash

setopt menucomplete

SPROMPT='zsh: Заменить '\''%R'\'' на '\''%r'\'' ? [Yes/No/Abort/Edit] '
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=$color[cyan]=$color[red]"

typeset -g -A key

autoload -U url-quote-magic
zle -N self-insert url-quote-magic

autoload -U zcalc

function avg
{
    THRESHOLD_LOAD=75
    COLOUR_LOW="%{$fg_bold[green]%}"
    COLOUR_HIGH="%{$fg_bold[red]%}"

    export NOCOLOR=1
    ONE=$(uptime | sed -e "s/.*load average: \(.*\...\),\(.*\...\),\(.*\...\)/\1/" -e "s/ //g")
    ONEHUNDRED=$(echo -e "scale=0 \n $ONE/0.01 \nquit \n" | bc)
    export NOCOLOR=0
    if [ $ONEHUNDRED -gt $THRESHOLD_LOAD ]
    then
            echo $COLOUR_HIGH
        else
            echo $COLOUR_LOW
    fi
}

PS1="[$(avg)%*%{$reset_color%}][%{$fg_bold[blue]%}%n%{$reset_color%}@%{$fg_bold[yellow]%}%m%{$reset_color%}:%{$fg_bold[cyan]%}%~%{$reset_color%}]$ "
PS2="> "
RPS1=""

prompt_opts=( cr percent )

case $TERM in (xterm*|rxvt)
    precmd () { print -Pn "\e]0;%n@%m: %~\a" }
    preexec () { print -Pn "\e]0;%n@%m: $1\a" }
    ;;
esac

NOCOLOR=0

if [ -e "/usr/bin/fortune" ]; then
    echo "Fortune: "
    /usr/bin/fortune
    echo
fi
echo

if [[ "$TERM" == "xterm" ]]; then
    screen
fi
