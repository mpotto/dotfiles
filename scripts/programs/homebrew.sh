#!/bin/bash

NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo >> /Users/mpotto/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/mpotto/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"


