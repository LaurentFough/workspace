# colore sdterr en rouge
# exec 2>>( while read X; do print "\e[91m${X}\e[0m" > /dev/tty; done & )



# Finished adapting your PATH environment variable for use with MacPorts.

# Scripts personnels
export PATH=${PATH}:${HOME}/.usr/bin



## OPAM configuration
#. /Users/hubert/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
eval `opam config env`

