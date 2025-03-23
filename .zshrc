HISTFILE=~/.zsh_history

HISTSIZE=10000
SAVEHIST=10000

setopt SHARE_HISTORY
export SHELL="zsh"
export EDITOR="nvim"


source $HOME/secret.env
source $HOME/.env 


plugins=(git)
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh



ZSH_THEME=""

alias FM="cd ~/Documents/ms_proj"
alias pa="source ./.venv/bin/activate"
alias ut="python -m unittest discover -p 'test_*.py' -s test"
alias gg="lazygit"
alias nt="cargo nextest run"
alias dc="docker compose"
alias tf="terraform"
export VPN="$HOME/openvpn_sean_craven.ovpn"


eval "$(starship init zsh)"
eval "$(zoxide init zsh --cmd cd)"

export FZF_COMPLETION_OPTS='--border --info=inline'

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
  esac
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source <(fzf --zsh)
