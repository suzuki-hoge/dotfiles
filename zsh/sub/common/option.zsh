# word is separated by this chars
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# colored ls output
export CLICOLOR=true

# path alias
hash -d d=$DOTFILES
hash -d dot=$DOTFILES

export EDITOR=vim

export JAVA_HOME=$(/usr/libexec/java_home -v 21)
