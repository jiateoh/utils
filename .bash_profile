export LSCOLORS=GxFxCxDxBxegedabagaced
export CLICOLOR=1
# source /Users/jteoh/workspace/utils/aliases

export EDITOR=/usr/bin/vim
export WORKSPACE="~/workspace"
alias ws="cd $WORKSPACE"
export HISTTIMEFORMAT='%x %X '
alias sourcee="source ~/.bash_profile"


#http://code-worrier.com/blog/autocomplete-git/
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
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


#Git branch in prompt.
#http://martinfitzpatrick.name/article/add-git-branch-name-to-terminal-prompt-mac/

parse_git_branch() {

    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

}

export PS1="\A \u@\h \[\e[1;34m\]\w\[\e[m\] \[\033[32m\]\$(parse_git_branch)\[\033[00m\] \$"

export ASKY_KEY="ezEqjmBbFqdFgbCDJ6WyNyjb/ExuIF3al68r5Lq4k3BfBBabLN3gmloI5PVxrI7aWvv2CCGawpKQ5udL54TGFw=="
# hub is a wrapper for git, with github support                                                                                                               │·····················
# alias git=hub
