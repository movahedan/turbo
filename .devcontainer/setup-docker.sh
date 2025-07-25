#!/bin/bash

# Fix node_modules directory permissions ---------------------------------------
echo "Fixing node_modules directory permissions..."
sudo rm -rf /app/node_modules
sudo chown -R vscode-user:vscode-user /app/node_modules
sudo chmod -R 777 /app/node_modules

# Fix file ownership for development files (excluding git objects) ------------
echo "Fixing file ownership for development files..."
sudo chown -R vscode-user:vscode-user /app/apps /app/packages /app/scripts
sudo chown -R vscode-user:vscode-user /app/package.json /app/bun.lock /app/turbo.json /app/biome.json
sudo chown -R vscode-user:vscode-user /app/commitlint.config.ts /app/lefthook.yml /app/.env /app/.npmrc
sudo chown -R vscode-user:vscode-user /app/README.md /app/LICENSE /app/renovate.json
sudo chown -R vscode-user:vscode-user /app/.devcontainer /app/.changeset /app/.cursor /app/.vscode /app/.turbo

# Setup Docker permissions for cross-platform compatibility ---------------------
# This script handles Docker socket permissions for Linux/macOS
# Windows uses Docker Desktop and doesn't need socket permissions

echo "Setting up Docker permissions..."
# Check if Docker socket exists (Linux/macOS)
if [ -S /var/run/docker.sock ]; then    
    # Set socket permissions for non-root access
    sudo chmod 666 /var/run/docker.sock
    # Add user to docker group
    sudo usermod -aG vscode-user $USER
    echo "Docker permissions configured for Linux/macOS"
else
    echo "No Docker socket found, assuming Windows or Docker Desktop"
fi

# Install act for local GitHub Actions testing ----------------------------------------------------
echo "Installing act for local GitHub Actions testing..."
curl -s https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash
# Move act to PATH
sudo mv ./bin/act /usr/local/bin/act || true
# Create act config directory and file
mkdir -p .act
cat > .act/actrc << EOF
# act configuration file
--image-size micro
--platform ubuntu-latest
--quiet
--secret-file .env
--reuse
EOF

# Install dependencies
echo "Installing dependencies..."
bun install

echo "Setup complete!" 
