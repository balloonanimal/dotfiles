# colors and prompt
autoload -U colors && colors

# prompt
# (time in brackets, blue) (usr@hostname) (path) $
PS1="%B%{$fg[blue]%}[%T] %{$fg[magenta]%}%n@%M %{$fg[white]%}%3~ %{$fg[green]%}$ %{$reset_color%}%b"
# export PS1="\[\033[34m\][\A]\[\033[00m\] \w \[\033[32m\]$ \[\033[00m\]"

stty stop undef		# Disable ctrl-s to freeze terminal.

# startup in emacs mode
set -o emacs

# history in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# aliases
## Sane defaults
alias \
    cp="cp -iv" \
    mv="mv -iv" \
    rm="rm -vI" \
    yt="youtube-dl --add-metadata -i" \
    yta="yt -x -f bestaudio/best" \
    ffmpeg="ffmpeg -hide_banner"

## Colorize
alias \
    ls="ls -hN --color=auto --group-directories-first" \

## New commands
alias \
    e="emacsclient -c -a emacs" \
    magit="e --eval \"(magit)\"" \
    ll="ls -l"
## ediff
ediff() {
    e --eval "(ediff-files \"$1\" \"$2\")"
}

## ediff
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
