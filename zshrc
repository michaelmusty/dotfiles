# Explicitly configured $PATH variable
PATH=/usr/local/git/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/local/bin:/opt/local/sbin:/usr/X11/bin
PATH=/usr/local/texlive/2018/bin/x86_64-linux:$PATH
# PATH=/home/mjmusty/anaconda3/bin:$PATH
PATH=/home/mjmusty/sagebuild/bin:$PATH

# MAGMAPASSFILE=/usr/local/magma/magmapassfile
# export MAGMAPASSFILE

#gems
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH

#rust path not needed
#export PATH=$HOME/.cargo/bin:$PATH

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
# Timestamps
HIST_STAMPS="mm/dd/yyyy"

#
ZSH_DISABLE_COMPFIX=true

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="xiong-chiamiov-plus"
#ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"
#ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="bullet-train"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(web-search vi-mode urltools taskwarrior python lol last-working-dir jsontools history gem fasd git git-extras repo sudo bundler web-search command-not-found coffee compleat)

source $ZSH/oh-my-zsh.sh

# Put any proprietary or private functions/values in ~/.private, and this will source them
if [ -f $HOME/.private ]; then
  source $HOME/.private
fi

if [ -f $HOME/.profile ]; then
  source $HOME/.profile  # Read Mac .profile, if present.
fi

# capslock
setxkbmap -option caps:escape

# Shell Aliases
## Git Aliases
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias got='git '
alias get='git '

## Vagrant Aliases
alias vag='vagrant'
alias vagup='vagrant up'
alias vagdestroy='vagrant destroy'
alias vagssh='vagrant ssh'
alias vaghalt='vagrant halt'

# server Aliases
alias gauss='ssh mjmusty@math.dartmouth.edu'
alias doob='ssh mjmusty@doob.dartmouth.edu'
alias toby='ssh mjmusty@toby.dartmouth.edu'

## Miscellaneous Aliases
#alias htop='sudo htop'
alias htop='htop'

## rust aliases
alias rg=~/Projects/ripgrep/target/release/rg

## fasd
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection

# Shell Functions
# qfind - used to quickly find files that contain a string in a directory
qfind () {
  find . -exec grep -l -s $1 {} \;
  return 0
}
up() {
  upgrade_oh_my_zsh
  sudo tlmgr update --self
  sudo tlmgr update --all
  sudo apt-get update
  sudo apt-get upgrade
  rustup update
  rustc --version
}
tc() {
  latexmk --enable-write18 -pdf -pdflatex="xelatex %O %S" $1
  latexmk -c
}
tp() {
  latexmk --enable-write18 -pdf -pdflatex="xelatex %O %S" -pv $1
  latexmk -c
}
up_website() {
  cd ~/Projects/michaelmusty.github.io
  bundle update
  bundle exec jekyll build
  git add --all
  git commit -m $1
  git push
}
adjust_brightness() {
  # xrandr | grep " connected" | cut -f1 -d " "
  # eDP-1
  xrandr --output eDP-1 --brightness $1
}
d3ssins_push () {
  cd ~/Projects/d3ssins/
  git add --all
  git commit -m "update"
  git push
}

##### appends #####

# added by travis gem
[ -f /home/mjmusty/.travis/travis.sh ] && source /home/mjmusty/.travis/travis.sh
