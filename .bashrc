#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Foot's prompt marker
prompt_marker() {
    printf '\e]133;A\e\\'
}
PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }prompt_marker

export EDITOR=nvim
export MANPAGER='nvim +Man!'

alias n="nvim"

alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

eval "$(starship init bash)"
eval "$(mise activate bash)"

export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

[[ -r /usr/share/bash-preexec/bash-preexec.sh ]] && source /usr/share/bash-preexec/bash-preexec.sh

eval "$(atuin init bash --disable-up-arrow)"
. "$HOME/.atuin/bin/env"

