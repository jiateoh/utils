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

function prompt {
    export PS1="\A \u@\h \[\e[1;34m\]\w\[\e[m\] \[\033[32m\]\$(parse_git_branch)\[\033[00m\] \$"
}

prompt

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
