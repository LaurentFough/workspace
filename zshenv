# colore sdterr en rouge
# exec 2>>( while read X; do print "\e[91m${X}\e[0m" > /dev/tty; done & )

# Scripts personnels
export PATH=${PATH}:${HOME}/.usr/bin

# iML
# export PATH=${PATH}:${HOME}/Dropbox/projects/ml-overloading/src


# cabal
export PATH=${HOME}/.cabal/bin:${PATH}
export PATH=${HOME}/.cabal-sandbox/bin:${PATH}
# export PATH="$HOME/Library/Haskell/bin:$PATH
