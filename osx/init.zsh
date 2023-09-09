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

# Open current directory on IDE

alias idea_here='open -a IntelliJ\ IDEA\ CE .'
alias pycharm_here='open -a PyCharm .'
alias webstorm_here='open -a WebStorm .'
alias goland_here='open -a GoLand .'

open_in_goland() {
  local cmd="fzf"
  if [[ -n "$1" ]]; then
    cmd="fzf -q $1"
  fi

  open -a GoLand  $(locate -r '/\.git$' | sed -r 's/\/.git$//' | eval $cmd)
}

