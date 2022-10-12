#!/bin/sh -eu

TARGET_PATH=~/.dotfiles

# Check whether TARGET_PATH exists.
if [ -d $TARGET_PATH ]; then
    >&2 echo "It seems dotfiles are already installed. You have to remove $TARGET_PATH before continue installing."
    exit 1
fi

# Check whether git exists.
if ! (which git > /dev/null 2>&1); then
    >&2 echo 'Git is not installed on this system.'
    exit 1
fi

echo "Cloning dotfiles to $TARGET_PATH"
git clone git@github.com:zhaostu/dotfiles.git $TARGET_PATH

# Initialize all Git submodules
cd $TARGET_PATH
git submodule update --init

echo 'Installing dotfiles.'
$TARGET_PATH/scripts/install.sh

echo 'Finished!'
