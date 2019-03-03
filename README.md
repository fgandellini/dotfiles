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
