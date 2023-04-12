# Load Java 17 - java 18 is still messy
export JAVA_HOME=`/usr/libexec/java_home -v 17`
export GRAALVM_HOME=`/usr/libexec/java_home -V 2>&1 | grep GraalVM | sed -r 's/^.+(\/Library.+)$/\1/'`

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
export PATH="$PATH:/Applications/IntelliJ IDEA CE.app/Contents/MacOS"
