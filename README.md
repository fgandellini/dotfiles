# Dotfiles

This is my dotfiles repo.

It follows the approach described [here](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/).

## Usage

Restore dthis repo with:

```
git clone --bare https://github.com/fgandellini/dotfiles $HOME/.dotfiles
cd $HOME/.dotfiles
./restore-dotfiles.sh
```

you can then manage dotfiles with the `dotfiles` command:

```
dotfiles status
dotfiles add .vimrc
dotfiles commit -m "Add vimrc"
dotfiles add .zshrc
dotfiles commit -m "Add zshrc"
dotfiles push
```
