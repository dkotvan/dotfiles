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

