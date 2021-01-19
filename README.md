# dotfiles

This is my dotfiles repo.

It follows the approach described [here](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/).

## Usage

Restore this repo with:

```
curl -Lks https://git.io/fhxJj | /bin/bash
```

Manage dotfiles with the `dotfiles` command:

```
dotfiles status
dotfiles add .vimrc
dotfiles commit -m "Add vimrc"
dotfiles add .zshrc
dotfiles commit -m "Add zshrc"
dotfiles push
```

### Visual Studio Code Extensions

Visual Studio Code extensions needs to be manually updated/restored.

Save the current list with:

```
code --list-extensions | xargs -L 1 echo code --install-extension > vscode-extensions
```

Restore extensions with:

```
./vscode-extensions
```


### GNOME Terminal theme

Install the [One for GNOME Terminal](https://github.com/denysdovhan/one-gnome-terminal) theme with:

```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/denysdovhan/gnome-terminal-one/master/one-dark.sh)"
```