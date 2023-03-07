# .zshrc
#
# Inspired by oh-my-zsh, uninspired by oh-my-zsh's runtime overhead

# enable OSC-7 escape sequence for spawning new shell in CWD
# (needed for `foot` terminal)
function osc7 {
	local LC_ALL=C
	export LC_ALL

	setopt localoptions extendedglob
	input=( ${(s::)PWD} )
	uri=${(j::)input/(#b)([^A-Za-z0-9_.\!~*\'\(\)-\/])/%${(l:2::0:)$(([##16]#match))}}
	print -n "\e]7;file://${HOSTNAME}${uri}\e\\"
}
autoload -Uz add-zsh-hook
add-zsh-hook -Uz chpwd osc7

# set prompt theme
if [ -r "$HOME/.zsh/theme/wbv.theme.zsh" ]; then
	. "$HOME/.zsh/theme/wbv.theme.zsh"
	# and disable virtualenv from modifying PS1 since it's part of the theme now
	export VIRTUAL_ENV_DISABLE_PROMPT=1
fi

## zsh-autosuggestions -- disabled for now, more annoying than helpful
#if [ -r /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
#	. /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#fi

# zsh-autocompletions
if [ -r "$HOME/.zsh/completions.zsh" ]; then
	. "$HOME/.zsh/completions.zsh"
fi

# zsh-syntax-highlighting: must go last!
if [ -r /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
	typeset -A ZSH_HIGHLIGHT_STYLES
	ZSH_HIGHLIGHT_STYLES[path]='bold' # don't underline paths
	. /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
