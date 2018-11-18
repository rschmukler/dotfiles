# Dotfiles

A collection of useful dotfiles for my workflow.


## Installation

Expects to be installed at `~/dev/dotfiles`


## Antibody

This repo expects using [antibody](https://getantibody.github.io/) 
to manage zsh plugins. Below are some useful commands for working with 
antibody:

Installing antibody:
```
curl -sL git.io/antibody | sh -s
```

Installing new plugins:
```
antibody bundle < zsh_plugins.txt > zsh_plugins.sh

```

## Google Cloud SDK

Frequently used. Expecting it to be installed to `/usr/local/share`.

```
curl https://sdk.cloud.google.com | sudo bash
```
