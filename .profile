# .profile
#
# login shell configuration

# if using bash, also include bash customizations
if [ -n "$BASH_VERSION" ]; then
	# include .bashrc if it exists
	if [ -f "$HOME/.bashrc" ]; then
		. "$HOME/.bashrc"
	fi
fi

## all other shell-agnostic environment configuration

# specify language environment
export LANG=en_US.UTF-8

# preferred editor for local and remote sessions
export EDITOR='vim'

# add XDG_DESKTOP_HOME local applications to the path
if [ -r "$HOME/.local/bin" ]; then
	export PATH="$HOME/.local/bin:$PATH"
fi

# rust/cargo setup
if [ -r "$HOME/.cargo/env" ]; then
	. "$HOME/.cargo/env"
fi

# xilinx setup
# NOTE: change /opt/Xilinx as needed if you installed Xilinx tools elsewhere
if [ -r /opt/Xilinx ]; then
	# tools directory
	export XILINX=/opt/Xilinx
	# fixes issue with blank white screen on GUI opening
	export _JAVA_AWT_WM_NONREPARENTING=1
	# add any extra info (license file, etc)
	if [ -r "$HOME/.config/xilinx.env" ]; then
		. "$HOME/.config/xilinx.env"
	fi
fi

# pyenv configuration (if we have pyenv)
if [ -r "$HOME/.pyenv" ]; then
	export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"
	command pyenv rehash 2>/dev/null
	pyenv() {
		local command
		command="${1:-}"
		if [ "$#" -gt 0 ]; then
			shift
		fi
		case "$command" in
		rehash|shell)
			eval "$(pyenv "sh-$command" "$@")"
			;;
		*)
			command pyenv "$command" "$@"
			;;
		esac
	}
fi

# wayland configuration
if [ -r "$HOME/.config/$(hostname).profile" ]; then
	. "$HOME/.config/$(hostname).profile"
fi
