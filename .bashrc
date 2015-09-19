# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

export ARCANIST_PATH=/Users/jon/DEV/arcanist/arcanist
export PATH=$PATH:$ARCANIST_PATH/bin
export PATH=/Users/jon/.cabal/bin:$PATH
# Prefer homebrew-installed programs over system ones
export PATH=/usr/local/bin:$PATH

export MANPATH=/usr/local/opt/erlang/lib/erlang/man:$MANPATH

export EDITOR=vim
export CLING_EXE=/Users/jon/DEV/cling/bin/cling

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.

export HISTCONTROL=ignoreboth
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0.jdk/Contents/Home/

# bash-completion and additional scripts
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
source $ARCANIST_PATH/resources/shell/bash-completion

# git branch name and status in prompt
export PS1='\w$ '
prompt_git() {
  git branch &>/dev/null || return 1
  HEAD="$(git symbolic-ref HEAD 2>/dev/null)"
  BRANCH="${HEAD##*/}"
  STATUS=""
  [[ -n "$(git status -s 2>/dev/null)" ]] && STATUS=$STATUS" *"
  printf '[%s] ' "${BRANCH:-unknown}${STATUS}"
}
export PS1='$(prompt_git)'${PS1}


source .private_tokens
source .bash_aliases

