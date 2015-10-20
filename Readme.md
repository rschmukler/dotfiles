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

## What's included? / Tools

I am a big proponent of workflow optimization. Ultimately my dotfiles contain
configs for the tools that I rely on most. Most of them are obvious, but I'll
name a few of the lesser knowns.

- `jshintrc` - config for [JSHint](https://github.com/jshint/jshint) a lint-like
  tool for Javascript.
- `slate.js` - config for [slate](https://github.com/jigish/slate)
- `ag` - a faster replacement of ack. Doesn't support configs yet, but still is
  better. See [the silver searcher](https://github.com/ggreer/the_silver_searcher). Subsequently using [sift](https://sift-tool.org)

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
- Create vim tmp dir. Vim by default places `swp` and `tmp` files in the working
  dir. If it doesn't close properly this leads to dirty git repos. We make a
  directory for it to house all its junk. See my `vimrc` for example of how to
  configure vim to use this dir.
- Execute Vim `BundleInstall` and Launch Zsh.
