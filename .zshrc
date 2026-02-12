# Zsh configuration for Taichi

# NVM setup
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/nvm_completion" ] && \. "$NVM_DIR/nvm_completion"

# Path setup
export PATH="$HOME/.neon/bin:$PATH"
export PATH="$HOME/python-tools/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# History configuration (zsh-style)
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt APPEND_HISTORY

# Enable colors
autoload -U colors && colors

# Simple zsh prompt (macOS compatible)
PROMPT='%F{green}%n@%m%f:%F{blue}%~%f$ '

# Modern CLI aliases (eza instead of ls)
alias ls='eza'
alias ll='eza -alF --git'
alias la='eza -a'
alias l='eza -F'
alias tree='eza --tree'

# Better cat/find
alias cat='bat --paging=never'
alias find='fd'

# Grep with color
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Git aliases
alias gaa='git add .'
alias gcm='git commit -m'
alias gp='git push'
alias gpo='git push --set-upstream origin $(git branch --show-current)'
alias main='git checkout main; git pull'

# Git branch functions
function gcb() {
  git checkout -b taichi/$1
}

function gc() {
  git checkout taichi/$1
}

# Lint function
function lint() {
  (cd ~/agent && ./scripts/lint.sh $1 .)
}

# Rust format alias
alias format='cargo fmt --all -- --config-path /home/dev/src/prospero/rust/.rustfmt.toml'

# Server aliases
alias run-server='(cd ~/src/prospero/rust/api && cargo-watch -x "run --bin api_server -- -e")'
alias python-format='(cd ~/src/prospero/python && ~/src/scripts/lint.sh -f .)'

# Environment variables (non-sensitive)
export VIRTUAL_ENV="/home/dev/src/prospero/python/.venv"
export USER=${USER:-taichi}
export UV_LINK_MODE=copy

# Load secrets from separate file (chmod 600)
[[ -f "$HOME/.secrets" ]] && source "$HOME/.secrets"

# Optional tool initializations (only load if installed)
[[ -f "$HOME/.rye/env" ]] && source "$HOME/.rye/env"
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
[[ -f "$HOME/.atuin/bin/env" ]] && source "$HOME/.atuin/bin/env" && eval "$(atuin init zsh)"
[[ -f ~/.local/share/blesh/ble.sh ]] && source ~/.local/share/blesh/ble.sh

# Load project-specific env if it exists (macOS path)
[[ -f "$HOME/agent/.env" ]] && export $(grep -v '^#' "$HOME/agent/.env" | xargs)

# Enable zsh completion system
autoload -Uz compinit && compinit
source ${HOME}/.ghcup/env

# Modern CLI tool integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
