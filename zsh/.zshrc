### Custom ZSHrc ###

autoload -Uz compinit vcs_info add-zsh-hook promptinit

set -o vi

SAVEHIST=1000
HISTSIZE=1000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab completion:
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export SSH_KEY_PATH="$HOME/.ssh/id_ed25519"

# User Bins
export PATH=$PATH:$HOME/bin:$HOME/go/bin:$HOME/bin/nvim/bin:$HOME/.local/bin
# System Defauts
export PATH=$PATH:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

alias ls="ls -lh --color"
alias la="ls -lha --color"
alias vim="nvim"
alias szsh="source ~/.zshrc"
alias ezsh="nvim ~/.zshrc"
alias telegram="flatpak run org.telegram.desktop </dev/null &>/dev/null &; disown; exit 0;"
alias cdlsq="cd go/src/github.com/jrswab/lsq"
alias cdguild="cd go/src/github.com/jrswab/guild"
alias redshift="redshift -l 40.44:-79.99"
alias python="python3"
alias aider="aider --config $HOME/.config/aider.conf.yml"

alias sshx220="ssh jaron@192.168.1.153"

# Git Shortcuts:
alias gbd='git branch --merged | grep -Ev "(^\*|^\+|master|main|dev)" | xargs --no-run-if-empty git branch -d'

## Custom Prompt:
new_line () { echo "" }
status_l () { print -rP '%B%F{green}%T%f %F{magenta}%~%f ${vcs_info_msg_0_:-}%b' }
add-zsh-hook precmd vcs_info
add-zsh-hook precmd new_line
add-zsh-hook precmd status_l

setopt prompt_subst
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr   ' %F{green}+%f'
zstyle ':vcs_info:*' unstagedstr ' %F{red}*%f'
zstyle ':vcs_info:git:*' formats       '%b%u%c'
zstyle ':vcs_info:git:*' actionformats '%b|%a%u%c'
PROMPT='%F{green}➜%f '

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
