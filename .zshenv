# .zshenv
#
# user-specific environment variables for zsh

# save infinite (read: a million) lines of history
HISTFILE="$HOME/.zsh_history"
SAVEHIST=1000000
HISTSIZE=1000000
setopt INC_APPEND_HISTORY_TIME

# enable color support by-default for gcc, ls, grep, etc...
if [ -r "$HOME/.local/share/lscolors.sh" ]; then
	source "$HOME/.local/share/lscolors.sh"
	export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
fi
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'

# make ssh connections use a sane default for term capabilities
# (most destinations don't recognize TERM=foot)
alias ssh='TERM=xterm-256color COLORTERM=truecolor ssh'
