#!/bin/bash

# file: src/bash/aspark-starter/install-prerequisites-for-aspark-starter.sh

set -eu -o pipefail # fail on error , debug all lines

sudo apt-get install -y perl
sudo apt-get install -y zip unzip
sudo apt-get install -y exuberant-ctags
sudo apt-get install -y mutt


# eof file src/bash/aspark-starter/install-prerequisites-for-aspark-starter.sh
