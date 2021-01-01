# Ruby needs LANG to be set to correctly deal with external files
set -x LANG en_US.UTF-8
set -x EDITOR vim

set -x GOPATH $HOME/go
set -x GOBIN $GOPATH/bin

set -x PATH $PATH $GOBIN
set -x PATH $PATH $HOME/.cargo/bin

set -x PATH "/usr/local/sbin" $PATH
