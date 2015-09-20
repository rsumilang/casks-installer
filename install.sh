#!/usr/bin/env bash
###########################################################
# Automates installing applications by category
#
# Note: This will require homebrew and cask!
# See: http://caskroom.io/
#
# Uninstall: Provide the --appdir when removing.
#
# @author   Richard Sumilang <me@richardsumilang.com>
# @url      https://github.com/rsumilang/casks
# @homepage http://richardsumilang.com
###########################################################

INSTALL_CMD="brew cask install --appdir=/Applications"

if [ $1 ]
then
  echo "Processing ./category/$1.sh..."
  ./category/$1.sh "$INSTALL_CMD"
else
  for f in ./category/*.sh;
  do
    "Processing $f...";
  done
fi
