#!/bin/bash

echo "Installing NVM, Node.js and pnpm"

# installs NVM (Node Version Manager)
curl -s -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash > /dev/null
# Add the following lines to your shell configuration file
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# List available Node.js versions
nvm list

# Ask the user to choose a Node.js version
read -p  "Choose a Node.js version (default is the latest): " version

# If the user didn't choose a version, use the latest one
if [ "$version" = "q" ]; then
  echo "Quitting..."
  exit 0
fi

# If the user didn't choose a version, use the latest one
if [ -z "$version" ]; then
  version=stable
fi

# Install the version chosen
if [ -z "$version" ]; then
  version=$(nvm list | awk '/->/ {print $3}')
fi

# download and install Node.js
nvm install $version > /dev/null


# download and install pnpm
wget -qO- https://get.pnpm.io/install.sh | sh - > /dev/null

echo "Installation complete. Please restart your terminal or run the following command to apply the changes:"
echo "source ~/.bashrc"
