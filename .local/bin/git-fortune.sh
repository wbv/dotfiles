#!/bin/sh

# get your `fortune` from a random commit in your current git repository
# falling back to a helpful message

git rev-parse --is-inside-work-tree >/dev/null 2>&1
in_git_repo=$?
if [ $in_git_repo -ne 0 ]; then
	cat <<-EOF
I'm not being run from inside a git repository.

 -- git-fortune.sh
EOF
	exit $in_git_repo
fi

git rev-list --all \
	| cut -f1 -d' ' \
	| sort -R \
	| head -n 1 \
	| git rev-list \
		--no-walk \
		--no-commit-header  \
		--stdin  \
		--format="format:%s%b%n%n -- %an"
