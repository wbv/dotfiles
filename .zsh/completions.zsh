zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**' '+r:|[._-]=** r:|=** l:|=*'
zstyle ':completion:*' original true

# pyenv completions
if [ -f "$PYENV_ROOT/completions/pyenv.zsh" ]; then
	. "$PYENV_ROOT/completions/pyenv.zsh"
fi


autoload -Uz compinit
compinit
