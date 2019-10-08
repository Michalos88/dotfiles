export PATH=/usr/local/bin:/usr/local/sbin:$PATH:$HOME/.rvm/bin


# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(
  git
  osx
  rails
  node
  heroku
  python
  autopep8
  colored-man-pages
  dotenv
  fancy-ctrl-z
  gitignore)
source $ZSH/oh-my-zsh.sh

for file in ~/.{functions,aliases}; do
    [ -r "$file" ] && source "$file"
done
unset file

# disable marking untracked files under VCS as dirty DISABLE_UNTRACKED_FILES_DIRTY="true"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export PATH="$HOME/.fastlane/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/michallyskawinski/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/michallyskawinski/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/michallyskawinski/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/michallyskawinski/google-cloud-sdk/completion.zsh.inc'; fi
