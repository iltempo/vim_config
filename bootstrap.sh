function die()
{
    echo "${@}"
    exit 1
}

git clone git@github.com:iltempo/vim_config.git ${HOME}/.vim_config
cd $HOME/.vim_config || die "Could not go into the ${HOME}/.vim_config"
rake install || die "rake install failed."
