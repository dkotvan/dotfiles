export PATH=/opt/homebrew/sbin:/opt/homebrew/bin:$PATH

# Fix problem with Packer nvim plugin trying to update a lot of plugins at the same time
ulimit -S -n 200048

# Add docker-compose as a plugin for docker
if [ ! -d "~/.docker/cli-plugins/docker-compose" ]; then
  mkdir -p ~/.docker/cli-plugins
  ln -sfh $(brew --prefix)/opt/docker-compose ~/.docker/cli-plugins/docker-compose
fi

# Export DOCKER_HOST for Colima, make some utils to work, like ctop and lazydocker
export DOCKER_HOST="unix:///Users/$USER/.colima/docker.sock"
export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/docker.sock
export PATH="$PATH:/Applications/IntelliJ IDEA CE.app/Contents/MacOS:/Applications/GoLand 2024.2 EAP.app/Contents/MacOS"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"

