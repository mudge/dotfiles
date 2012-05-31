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

CLICOLOR=1
EDITOR="mvim -f"
JAVA_OPTS="-d32 -client"
CC="/usr/bin/gcc"
PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"
PATH="$HOME/.rbenv/bin:/usr/local/bin:${PATH/\/usr\/local\/bin:}"
export CLICOLOR EDITOR JAVA_OPTS PATH

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

# rbenv initialization.
eval "$(rbenv init -)"

# hub alias setup.
eval "$(hub alias -s)"

# Set up a prompt to look like so:
# ~/Projects/blah (master) 1.9.2-p290 (set by /Users/mudge/.rbenv/version)
# $
setopt prompt_subst
precmd() { print -rP '%{$fg[lightgrey]%}%B%~%b$(__git_ps1 " (%s)") %{$fg[red]%}$(rbenv version)' }
PROMPT='%{$fg[lightgrey]%}%B$%b %f'

# Key bindings.
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
bindkey '^[b' backward-word
bindkey '^[f' forward-word
bindkey '^[[3~' delete-char
