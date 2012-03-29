# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/mudge/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Use the funky menu completion.
zstyle ':completion:*' menu select

# Load colors as $F{grey} doesn't seem to exist.
autoload -Uz colors
colors

# Use Homebrew in ~/.brew
PATH="${HOME}/.brew/bin:$PATH"
MANPATH="${HOME}/.brew/share/man:$MANPATH"

# Use Homebrew's Python.
PATH="${HOME}/.brew/share/python:$PATH"

# Use mvim.
PATH="${HOME}/.mvim/bin:$PATH"

# Node.
NODE_PATH="${HOME}/.brew/lib/node_modules"

CLICOLOR=1
EDITOR="mvim -f"
JAVA_OPTS="-d32 -client"
export CLICOLOR EDITOR JAVA_OPTS PATH NODE_PATH MANPATH

# Load git's bash completion (which is frankly great)
# as it is compatible with ZSH and includes the __git_ps1
# function.
source $(brew --prefix)/etc/bash_completion.d/git-completion.bash

# Alias for firing up a Rails console in both Rails 2.3
# and > 3.0 projects.
alias sc="if [[ -x script/console ]]; then script/console; else script/rails console; fi"

# Delete branches that have already been merged into the current
# one both on the origin and locally.
cleanup () {
  for branch in $(git br -r --merged | grep -v origin/master | cut -f2 -d/)
  do
    git push origin :${branch}
  done

  for branch in $(git br --merged | grep -v '* master' | cut -c 3-)
  do
    git br -d ${branch}
  done
}

# Alias git to hub but do it with a function so that completion
# still works.
function git(){hub "$@"}

# rbenv initialization.
eval "$(rbenv init -)"

# Set up a prompt to look like so:
# ~/Projects/blah (master) 1.9.2-p290 (set by /Users/mudge/.rbenv/version)
# $
setopt prompt_subst
PROMPT='%{$fg[grey]%}%B%~%b$(__git_ps1 " (%s)") %{$fg[red]%}$(rbenv version)%{$fg[grey]%}
%B$%b %f'
