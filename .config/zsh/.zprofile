#!/bin/zsh

export TERMINAL="st"
export EDITOR="vim"
export BROWSER="firefox"
# export BROWSER="brave"

export MOZ_USE_XINPUT2="1"		# Mozilla smooth scrolling/touchpads.

# Set colors for less. Borrowed from https://wiki.archlinux.org/index.php/Color_output_in_console#less
export LESS="-R"
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"

# pyenv setup
# FIXME: currently disabled bc I don't do any python development and it breaks a
# lot of arch python packages
# if command -v pyenv 1>/dev/null 2>&1; then
#     eval "$(pyenv init -)"
#     eval "$(pyenv virtualenv-init -)"
# fi

# if in tty1 and xorg is not already running then start graphics
[ "$(tty)" = "/dev/tty1" ] && ! pidof Xorg >/dev/null 2>&1  && exec startx
