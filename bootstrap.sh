function die()
{
    echo "${@}"
    exit 1
}

mkdir -p ${HOME}/.vim
git clone git@github.com:iltempo/vim_config.git ${HOME}/.vim
cd $HOME/.vim || die "Could not go into the ${HOME}/.vim"
rake install || die "rake install failed."
