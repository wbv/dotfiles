# .profile
#
# login shell configuration

# if using bash, also include bash customizations
if [ -n "$BASH_VERSION" ]; then
	# include .bashrc if it exists
	if [ -f "$HOME/.bashrc" ]; then
		. "$HOME/.bashrc"
	fi
	# and shell-agnostic environment variables
	if [ -r "$HOME/.env" ]; then
		source "$HOME/.env"
	fi
fi

