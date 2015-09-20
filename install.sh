#!/usr/bin/env bash
###########################################################
# Automates installing applications by category
#
# Note: This will require homebrew and cask. It will go ahead and install them
#  if brew is missing.
#
# See: http://caskroom.io/
#
# Uninstall: Provide the --appdir when removing.
#
# @author   Richard Sumilang <me@richardsumilang.com>
# @url      https://github.com/rsumilang/casks
# @homepage http://richardsumilang.com
# @license  http://creativecommons.org/licenses/by-sa/3.0/
###########################################################

INSTALL_CMD="brew cask install --appdir=/Applications"

#
# Check if brew is installed. If not, install it and cask.
#
which -s brew
if [[ $? != 0 ]] ; then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  echo "Updating brew recipes..."
  brew update

  echo "Installing cask..."
  brew install caskroom/cask/brew-cask
fi


#
# Install category or all apps
#
if [ $1 ]
then
  echo "Processing ./category/$1.sh..."
  ./category/$1.sh "$INSTALL_CMD"
else
  for f in ./category/*.sh;
  do
    "Processing $f...";
    $f "$INSTALL_CMD"
  done
fi
