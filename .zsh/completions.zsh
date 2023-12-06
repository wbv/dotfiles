zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**' '+r:|[._-]=** r:|=** l:|=*'
zstyle ':completion:*' original true

# pyenv completions
if [ -r "$PYENV_ROOT/completions/pyenv.zsh" ]; then
	. "$PYENV_ROOT/completions/pyenv.zsh"
fi

# add zfunc files stored in ~/.zsh/zfunc (e.g. python-poetry's completions)
if [ -x "$HOME/.zsh/zfunc" ]; then
	fpath+="$HOME/.zsh/zfunc"
fi

autoload -Uz compinit && compinit -i
