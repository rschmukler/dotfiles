# Dotfiles

A collection of useful dotfiles for my workflow.

## Why dotfiles as a Git repo?

Often if you manage many servers / work on many computers you can end up having
to keep dotfiles in sync so that your environment remains consistant. Git is
pretty good at this. On top of that you get fun things like submodules, commit
history, etc.

## Installing and Use

First make sure you have the following installed:

```
Ruby
Zsh
Git
```

Then:

```
git clone git@github.com:rschmukler/dotfiles ~/.dotfiles
cd ~/.dotfiles
ruby install.rb
```

Enjoy!

## What's included?

I am a big proponent of workflow optimization. Ultimately my dotfiles contain
config for the tools that I rely on most. Most of them are obvious, but I'll
name a few of the lesser knowns.

- `ackrc` - config for [Ack](https://github.com/petdance/ack2). Useful for searching through projects for folders.
  Also see [ack.vim](https://github.com/mileszs/ack.vim).
- `jshintrc` - config for [JSHint](https://github.com/jshint/jshint) a lint-like
  tool for Javascript.
- `slate.js` - config for [slate](https://github.com/jigish/slate)


#### Files

Also included is a `files` directory. Inside there is my favorite color-scheme
for iTerm, as well as my `tmux-scripts` directory. See `tt` defined in `zshrc` to learn how these work with my zsh config.

## Other Notes

### Install.rb

This repo contains `install.rb` which helps to manage the install of these
dotfiles. People who wish to fork/create their own dotfile repo may find it
useful.

Running `install.rb` will do the following:

- Update init all existing submodules (`vim/bundle/vundle` and `oh-my-zsh`)
- Symlink Files
  * Symlink all files in the directory into `~/.name`. For example:
    `dotfiles/vimrc` symlinks to `~/.vimrc`.
  * Symlink `install/*` to `~/name`. I use this to keep stuff like zsh themes in
    sync. For example: `install/.oh-my-zsh/themes/rs.zsh-theme` will symlink
    that file to `~/.oh-my-zsh/themes/rs.zsh-theme`.
- Create vim tmp dir. Vim by default places `swp` and `tmp` files in the working
  dir. If it doesn't close properly this leads to dirty git repos. We make a
  directory for it to house all its junk. See my `vimrc` for example of how to
  configure vim to use this dir.
- Execute Vim `BundleInstall` and Launch Zsh.
