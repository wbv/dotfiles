## wbv's zsh theme
##
## - uses a modified version of oh-my-zsh's git library
## - theme modified from oh-my-zsh/themes/gnzh
##   - which was modified from oh-my-zsh/themes/bira
##     - (who knows if there's a further rabbit hole...)

function user_host_info() {
	# set different colors for user based on whether root or regular user
	local PR_USER='%(#.%F{red}.%F{green})%n%f'
	local PR_HOST='%M'

	# user@hostname
	echo -n "${PR_USER}%F{242}@%f${PR_HOST}"
}

function dir_info() {
	# current directory
	local current_dir="$(print -P %~)"
	local top_dir="$(basename ${current_dir})"
	echo -n " %F{blue}${current_dir%${top_dir}}%B${top_dir}%b%f"
#	echo -n "%F{blue}%~%f"
}

# ensure git commands don't try to do anything that would require a lock
# (i.e. don't interfere with any other processes working on a git repo)
function __git_prompt_git() {
	GIT_OPTIONAL_LOCKS=0 command git "$@"
}

# this prints the git branch or ref, or returns nothing
function git_info() {
	# exit with no output if not in a git repo (or don't have git)
	if ! __git_prompt_git rev-parse --git-dir &> /dev/null ; then
		return 0
	fi

	# otherwise, obtain the local ref of the repo
	# (i.e. branch or commit, if not on a branch)
	local ref
	ref=$(__git_prompt_git symbolic-ref --short HEAD 2> /dev/null) \
	|| ref=$(__git_prompt_git rev-parse --short HEAD 2> /dev/null) \
	|| return 0

	echo -n " %F{yellow}‹${ref:gs/%/%%}›%f"
}

# this prints the virtualenv name if in a virtualenv, otherwise nothing
function virtualenv_info() {
	# only print virtualenv if we have one set
	if [ ! -z "${VIRTUAL_ENV// }" ]; then
		echo -n " %F{magenta}($(basename $VIRTUAL_ENV))%f"
	fi
}

# perform the prompt theme computation, but scope away local variables through
# a function with no name
() {
	setopt prompt_subst
	# formatters for (left) prompt
	local startinfo='%F{242}{%f'
	local endinfo='%F{242}}%f'
	local promptchar='%F{250}%#%f '

	# formatters for right prompt
	local return_code="%(?..%B%F{red}(%?%)%B%f)"

	PROMPT="\
${startinfo}\$(user_host_info)\$(dir_info)\$(git_info)\$(virtualenv_info)${endinfo}
${promptchar}"
	RPROMPT="${return_code}"
}
