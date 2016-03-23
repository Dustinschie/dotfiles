# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# personal settings loaded before oh-my-zsh
if [[ -a ~/.personal.before.rc ]]; then
  source ~/.personal.before.rc
fi

# Set name of the theme to load.
ZSH_THEME="robbyrussell"

# zsh plugins
plugins=(git rails ruby rake rbenv tmux ssh-agent osx python brew virtualenvwrapper)

# turn off auto-updating, it will be handled by .dotfiles
DISABLE_AUTO_UPDATE=true

# load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# personal settings loaded after oh-my-zsh
if [[ -a ~/.personal.after.rc ]]; then
  source ~/.personal.after.rc
fi

# set vim as the default editor
export EDITOR=vim

# vi mode
bindkey jj vi-cmd-mode

# emacs mode
bindkey -e

# recover the readline keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^N" history-search-forward
bindkey "^F" forward-char
bindkey "^B" backward-char

# git undo last commit alias
alias git-undo="git reset --soft 'HEAD^'"

# git difftool aliases
alias gdt='git difftool'
alias gdtc='git difftool --cached'

# git add from pattern using ag
function ag-git-add() {
  ag --nocolor --null --files-with-matches "$*" | xargs -0 git add
}
alias aga=ag-git-add

# ls aliases
alias l='ls'
alias la='ls -la'
alias lah='ls -lah'

# use ./bin when it's safe (useful for Spring / tim pope's suggestion)
PATH=".git/safe/../../bin:$PATH"

# add node_modules/.bin to the path
PATH="$HOME/node_modules/.bin:$PATH"

# reload .zshrc
alias reload!='. ~/.zshrc'

# take me to my git home
alias git-home='cd "$(find-git-home)"'

# find git home directory
function find-git-home() {
  git rev-parse --show-toplevel
}

# find the filename of the last migration based on file timestamp
function last-migration() {
  ls -rt `find "$(find-git-home)/db/migrate" -type f -name "*" -print` | tail -1
}

# commands on last migration
alias vlmg='vim "$(last-migration)"'
alias rmlmg='rm "$(last-migration)"'

# homebrew
PATH="/usr/local/bin:$PATH"

# pyenv
if which pyenv > /dev/null;
  then eval "$(pyenv init -)";
fi

# pyenv/virtualenvwrapper; prefer pyenv
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"

# NVM
export NVM_DIR=~/.nvm
. $(brew --prefix nvm)/nvm.sh

# rbenv
if which rbenv > /dev/null;
  then eval "$(rbenv init -)";
fi
