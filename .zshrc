autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats "%b"
zstyle ':vcs_info:git*' actionformats "%b|%a"

autoload add-zsh-hook
add-zsh-hook precmd vcs_info

setopt prompt_subst
PROMPT="%{%F{yellow}%}%~%{%f%}> "
RPROMPT='%{%F{red}%}${vcs_info_msg_0_}%{%f%}'

alias git=hub

export CLICOLOR="Yes" EDITOR="vim" FZF_DEFAULT_COMMAND="rg --files --hidden --no-ignore-vcs"

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

source /usr/local/share/chnode/chnode.sh
source /usr/local/share/chnode/auto.sh

add-zsh-hook precmd chnode_auto
