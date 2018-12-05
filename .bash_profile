export LSCOLORS=GxFxCxDxBxegedabagaced
export CLICOLOR=1
source /Users/jteoh/Code/utils/aliases

export EDITOR=/usr/bin/vim
export WORKSPACE="~/workspace"
alias ws="cd $WORKSPACE"
export HISTTIMEFORMAT='%x %X '
alias sourcee="source ~/.bash_profile"

alias ll='ls -l'

#http://code-worrier.com/blog/autocomplete-git/
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

#GIT ALIASES YAY!
#warning: I overrode the default gs (ghostscript)
alias g="git "
alias gcam="git commit -am "
alias gd="git diff "
alias gl="git log "
alias gpr="git pull --rebase "
alias gs="git status "
alias gsh="git show "
alias gitka="gitk --all &"

#Git branch in prompt.
#http://martinfitzpatrick.name/article/add-git-branch-name-to-terminal-prompt-mac/

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# required for thefuck to evaluate ps1 - I think experimental mode uses a subshell?
# export -f parse_git_branch

export PS1="\A \u@\h \[\e[1;34m\]\w\[\e[m\] \[\033[32m\]\$(parse_git_branch)\[\033[00m\] \$"

export ASKY_KEY="ezEqjmBbFqdFgbCDJ6WyNyjb/ExuIF3al68r5Lq4k3BfBBabLN3gmloI5PVxrI7aWvv2CCGawpKQ5udL54TGFw=="
# hub is a wrapper for git, with github support                                                                                                               
# alias git=hub



alias baggins='cd ~/Code/baggins'


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

eval "$(jenv init -)"


#DB2 setup, based off http://stackoverflow.com/questions/23341171/how-do-i-install-db2-express-c-10-1-on-osx-mavericks
PATH=$PATH:/opt/IBM/db2/V10.1/bin
if [[ -f ~/jteoh/sqllib/db2profile ]]
then
source ~/jteoh/sqllib/db2profile
fi



# jet server
alias jet='ssh jet.cs.ucla.edu'
alias node-jet='ssh node@jet.cs.ucla.edu'


# Ignite
export IGNITE_HOME="/Users/jteoh/Code_Libraries/apache-ignite-fabric-2.3.0-bin"


# Set sbt options for BigSummary experiments (courtesy of Shagha)
export SBT_OPTS="-Xmx4G -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -Xss2M"

export PATH="/Users/username/.pyenv:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# export THEFUCK_DEBUG=true
# eval $(thefuck --alias --enable-experimental-instant-mode)
eval $(thefuck --alias)

source "/Users/jteoh/Code/PyExZ3/jteoh_setup.sh"
alias pez-folder="cd ~/Code/PyExZ3"

alias build-perfdebug="build/mvn -pl core package -DskipTests"


### TMUX history preservation configs, taken from https://askubuntu.com/questions/339546/how-do-i-see-the-history-of-the-commands-i-have-run-in-tmux
# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups

# append history entries..
shopt -s histappend

# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

