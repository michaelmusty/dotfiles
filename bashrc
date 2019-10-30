##############################################################################
#   Filename: .bashrc                                                        #
# Maintainer: Michael J. Smalley <michaeljsmalley@gmail.com>                 #
#        URL: http://github.com/michaeljsmalley/dotfiles                     #
#                                                                            #
#                                                                            #
# Sections:                                                                  #
#   01. General ................. General Bash behavior                      #
#   02. Aliases ................. Aliases                                    #
#   03. Theme/Colors ............ Colors, prompts, fonts, etc.               #
##############################################################################

##############################################################################
# 01. General                                                                #
##############################################################################
# Shell prompt
export PS1="\n\[\e[0;36m\]┌─[\[\e[0m\]\[\e[1;33m\]\u\[\e[0m\]\[\e[1;36m\] @ \[\e[0m\]\[\e[1;33m\]\h\[\e[0m\]\[\e[0;36m\]]─[\[\e[0m\]\[\e[1;34m\]\w\[\e[0m\]\[\e[0;36m\]]\[\e[0;36m\]─[\[\e[0m\]\[\e[0;31m\]\t\[\e[0m\]\[\e[0;36m\]]\[\e[0m\]\n\[\e[0;36m\]└─[\[\e[0m\]\[\e[1;37m\]\$\[\e[0m\]\[\e[0;36m\]]› \[\e[0m\]"

# If fortune is installed, run a fortune
if [ -e /opt/local/bin/fortune ]; then
    fortune -so
    echo " "
fi

# Capslock<-Esc
# setxkbmap -option caps:escape

##############################################################################
# 02. Aliases                                                                #
##############################################################################
# Enable colors in "ls" command output
alias ls="ls -Glah"

##############################################################################
# 03. Theme/Colors                                                           #
##############################################################################
# CLI Colors
export CLICOLOR=1
# Set "ls" colors
export LSCOLORS=Gxfxcxdxbxegedabagacad
# Install Ruby Gems to ~/gems
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH
# added by Anaconda3 2018.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/mjmusty/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/home/mjmusty/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/mjmusty/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/home/mjmusty/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# added by travis gem
[ -f /home/mjmusty/.travis/travis.sh ] && source /home/mjmusty/.travis/travis.sh
