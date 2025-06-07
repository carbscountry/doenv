#! /bin/bash
DOTFILES=$(shell cd "$(dir $(lastword $(MAKEFILE_LIST)))" && pwd)
set-zsh:
	bash ./zsh/install.sh

set-mise:
	bash ./mise/install.sh

set-gh:
	bash ./gh/install.sh

set-base:
	bash ./base_install.sh