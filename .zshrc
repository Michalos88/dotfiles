# Update PATH
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/.local/bin:$HOME/bin:$PATH

# Oh My Zsh configuration
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(
  git
  rails
  node
  python
  colored-man-pages
  fancy-ctrl-z
  gitignore
  kubectl
  zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh

# Source custom functions and aliases if available
for file in ~/.{functions,aliases}; do
  [ -r "$file" ] && source "$file"
done
unset file

# Enable autocd
setopt auto_cd

# Disable marking untracked files under VCS as dirty
DISABLE_UNTRACKED_FILES_DIRTY="true"

# RVM setup
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Fastlane setup
export PATH="$HOME/.fastlane/bin:$PATH"

# Google Cloud SDK
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then
  source "$HOME/google-cloud-sdk/path.zsh.inc"
fi
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then
  source "$HOME/google-cloud-sdk/completion.zsh.inc"
fi

# AWS CLI autocomplete
autoload bashcompinit && bashcompinit
complete -C 'aws_completer' aws

# Kubectl autocomplete
if command -v kubectl &>/dev/null; then
  source <(kubectl completion zsh)
fi

# NVM setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh" # Load NVM
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion" # Load NVM bash_completion

# Conda initialize
# !! Contents within this block are managed by 'conda init' !!
if command -v conda &>/dev/null; then
  eval "$(conda shell.zsh hook)"
else
  if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
    source "$HOME/miniconda3/etc/profile.d/conda.sh"
  elif [ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
    source "$HOME/anaconda3/etc/profile.d/conda.sh"
  fi
fi
