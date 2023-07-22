# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
	PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

. "$HOME/.asdf/asdf.sh"

# Changing "ls" to "exa"
alias l='exa -al --color=always --group-directories-first'  # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

alias vi="nvim"

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

eval "$(zoxide init bash)"
eval "$(starship init bash)"
source /home/zakharovdev/alacritty/extra/completions/alacritty.bash

[ -f "/home/zakharovdev/.ghcup/env" ] && source "/home/zakharovdev/.ghcup/env" # ghcup-env
