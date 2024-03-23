
alias ll='ls -lah'

#######
# GIT #
#######

alias ga='git add'
alias gc='git commit'
alias gp='git push'

#############
# DIR STACK #
#############
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index
