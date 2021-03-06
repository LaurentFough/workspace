eval "$(dircolors -b)"

# --------------------------------- VIMPAGER ----------------------------------


#export PAGER=vimpager
export PAGER=most
alias less=$PAGER
alias zless=$PAGER
#alias sed='gsed'

###############################################################################
###############################################################################
###############################################################################


###############
#  1. Alias   #
###############

# crontab
alias crontab="VIM_CRONTAB=true crontab"

# ledit
alias ocaml="ledit ocaml"
alias coq="ledit coqtop"

# SSH
alias proxy="ssh -nNTC -D 8080"
alias proxyportfwd="ssh -NTC -L 4444:127.0.0.1:4444"
alias proxyportbwd="ssh -NTC -R 4444:127.0.0.1:4444"

# test
alias plop="echo 'plop'"

# Perso
alias svim="sudo vim"
alias reload="source ~/.zshrc"

# Raccourcis pour 'ls'
alias ls="ls --color"
alias l="ls --color"
alias ll='ls -hl --color'
alias la='ls -a --color'
alias lla='ls -hla --color'

# Grep coloré
alias grep="grep --color"

# Confirmation avant suppression
# alias rm="rm -vi"

# Alias pratiques
alias c='clear'
alias s='cd ..'

if [ -f $HOME/.zshrc_plateform ]; then
  source $HOME/.zshrc_plateform
else
  print "404: $HOME/.zshrc_plateform not found."
fi

##################
#  2. Couleurs   #
##################

export red=$'%{\e[0;31m%}'
export RED=$'%{\e[1;31m%}'
export green=$'%{\e[0;32m%}'
export GREEN=$'%{\e[1;32m%}'
export blue=$'%{\e[0;34m%}'
export BLUE=$'%{\e[1;34m%}'
export purple=$'%{\e[0;35m%}'
export PURPLE=$'%{\e[1;35m%}'
export cyan=$'%{\e[0;36m%}'
export CYAN=$'%{\e[1;36m%}'
export WHITE=$'%{\e[1;37m%}'
export white=$'%{\e[0;37m%}'
export NC=$'%{\e[0m%}' 
export yellow=$'%{\e[0;33m%}'
export YELLOW=$'%{\e[1;33m%}'
export GGG=$'%{\033[40;01;33m%}'

##################
#  3. Le prompt  #
##################

# montre les informations concernant le gestionnaire de version (git, subversion, mercural)
#autoload -Uz vcs_info
#
#zstyle ':vcs_info:*' stagedstr '%F{green}●%f'
#zstyle ':vcs_info:*' unstagedstr '%F{yellow}●%f'
#zstyle ':vcs_info:*' check-for-changes true
#zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{red}:%f%F{yellow}%r%f'
#zstyle ':vcs_info:*' enable git svn
#
#precmd () {
#	if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
#		zstyle ':vcs_info:*' formats '%F{cyan}[%b%c%u%f%F{cyan}]%f'
#	} else {
#		zstyle ':vcs_info:*' formats '%F{cyan}[%b%c%u%f%F{red}●%f%F{cyan}]%f'
#	}
#	vcs_info
#}
#
# Detection du type de gestionnaire de version
#function prompt_char {
#	git branch >/dev/null 2>/dev/null && echo '±' && return
#	hg root >/dev/null 2>/dev/null && echo '☿' && return
#	svn info >/dev/null 2>/dev/null && echo '⚡' && return
#	echo '%#'
#}
#
#setopt prompt_subst	# exetension du prompt
#autoload -U colors && colors	# couleurs
#
# Prompt coté droit (infos gestionnaire de version)
#RPROMPT='%F{yellow}${vcs_info_msg_0_} %(!.%F{red}$(prompt_char)%f.$(prompt_char)) %F{white}'
#
# Prompt coté gauche (couleur différente pour le root)
#if [ "`id -u`" -eq 0 ]; then
#  export PS1="%{[36;1m%}%T %{[34m%}%n%{[33m%}@%{[37m%}%m %{[32m%}%~ %{[33m%}%#%{[0m%} "
#else
#  export PS1="%{[36;1m%}%T %{[31m%}%n%{[33m%}@%{[37m%}%M %{[32m%}%~ %{[33m%}%#%{[0m%} "
#fi
#
# Personnalisation du prompt
autoload -U promptinit
promptinit
#prompt clint
prompt adam2
#prompt bart

################################
# 4. Historique des commandes  #
################################

# Nombre d'entrées dans l'historique
export HISTORY=1000
export SAVEHIST=1000
# Fichier où est stocké l'historique
export HISTFILE=$HOME/.history

setopt hist_ignore_all_dups # ignore les doublons

###########################################
# 5. Complétion des options des commandes #
###########################################

# Ajout de l'autocomplétion
autoload -U compinit
compinit

# Amélioration auto complétion
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BDésolé, pas de résultats pour : %d%b'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

# On evite de reproposer des éléments deja présent dans un rm, mv ou cp
zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:mv:*' ignore-line yes
zstyle ':completion:*:cp:*' ignore-line yes

# Correction des commandes
# setopt correctall

# Cache de complétion utile pour les commandes lourdes
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_cache

# Kill amélioré
zmodload zsh/complist
setopt extendedglob
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"

# Couleur complétion
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors 'reply=( "=(#b)(*$VAR)(?)*=00=$color[green]=$color[bg-green]" )'
zstyle ':completion:*:*:*:*:hosts' list-colors '=*=30;41'
zstyle ':completion:*:*:*:*:users' list-colors '=*=$color[green]=$color[red]'
zstyle ':completion:*' list-colors ''

# Auto-complétion non sensible à la casse
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}'

# Ingnorer les fichiers suivant
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' \
    '*?.old' '*?.pro'

###########################################
# 			6. Diverse commandes          #
###########################################

# Une commande bien pratique qui extrait selon l'extension (% extract [file])
extract () {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xjf $1        ;;
             *.tar.gz)    tar xzf $1     ;;
             *.bz2)       bunzip2 $1       ;;
             *.rar)       rar x $1     ;;
             *.gz)        gunzip $1     ;;
             *.tar)       tar xf $1        ;;
             *.tbz2)      tar xjf $1      ;;
             *.tgz)       tar xzf $1       ;;
             *.zip)       unzip $1     ;;
             *.Z)         uncompress $1  ;;
             *.7z)        7z x $1    ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

ev() { echo
       set | egrep -i \^$1 |sed -e 's/=/     /' -e '/^PATH/d' -e '/^CDPATH/d' | sort
       echo }

eva() { echo
set | egrep -i "^[a-z_]*$1" |sed -e 's/=/     /' -e '/^PATH/d' -e '/^CDPATH/d' | sort
        echo }
###########################################
# 			7. Options                    #
###########################################

# A bas les beeps
unsetopt beep
unsetopt hist_beep
unsetopt list_beep

# cd inutile
setopt auto_cd 

export SVN_EDITOR=vim


##
# EOF
#

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
