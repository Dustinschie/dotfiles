# dotfiles
.files

##### Install ZSH (debian)
```bash
$ sudo apt-get update
$ sudo apt-get upgrade
$ sudo apt-get install zsh
$ chsh -s $(which zsh)
```
upon relog, you will be prompted to setup `.zshrc`. Select the option that reads as something like, 'Do nothing...'; that stuff will be setup when installing the dotfiles.

##### Install tmux, vim, git (debian)
```bash
$ sudo apt-get install tmux git vim
$ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
```

##### Setting up dotfiles
```bash
$ cd
$ git clone --recursive https://github.com/schie/dotfiles .dotfiles
$ cd .dotfiles
$ ./scripts/bootstrap.sh
```

##### Installing vim plugins
Enter vim in Ex:
```bash
$ vim -E
```
Install plugins
```bash
:PlugInstall
```


##### Install yarn (debian)
```bash
$ curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
$ echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
$ sudo apt-get update
$ sudo apt-get install yarn
```


##### Setup .netrc
this is for accessing 'machines' with out having to provide credentials every time.
```bash
# ~/.netrc
machine github.com
login <github username>
password <github password or personal access token>
```

##### Generate SSH RSA keys
```bash
$ ssh-keygen
```
