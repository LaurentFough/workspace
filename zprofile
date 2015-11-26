if [ -f $HOME/.zprofile_plateform ]; then
  source $HOME/.zprofile_plateform
else
  print "404: $HOME/.zprofile_plateform not found."
fi

# colore sdterr en rouge
# exec 2>>( while read X; do print "\e[91m${X}\e[0m" > /dev/tty; done & )

# Tranquil
#export PATH=/usr/local/tranquil/bin:$PATH


# Finished adapting your PATH environment variable for use with MacPorts.

# Scripts personnels
export PATH=${PATH}:${HOME}/.usr/bin

# iML
# export PATH=${PATH}:${HOME}/Dropbox/projects/ml-overloading/src


export PATH="$PATH":${HOME}/src/depot_tools

# cabal
#export PATH=${HOME}/.cabal/bin:${PATH}
#export PATH=${HOME}/.cabal-sandbox/bin:${PATH}

## OPAM configuration
#. /Users/hubert/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
eval `opam config env`

# GO
#export PATH=$HOME/.go/bin:$HOME/src/go/bin:$PATH
#export GOPATH=$HOME/.go:/opt/local

# RVM
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 

# Python
source $HOME/.pythonenv/bin/activate


# Local Ruby gem repository
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi
