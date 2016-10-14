ROOT_PATH = File.expand_path(File.join(File.dirname(__FILE__)))

desc "Link vim/macvim/tmux configuration files"
task :link_config_files do
  Dir['{g,}vimrc{.*,}', 'tmux.conf', 'git{ignore,config}'].each do |file|
    dest = File.expand_path("~/.#{file}")
    unless File.exist?(dest)
      ln_s(File.expand_path(file), dest)
    end
  end

  `mkdir -p ~/.config/nvim`
  nvim_dir = File.expand_path('~/.config/nvim')
  unless Dir.exist?(nvim_dir)
    Dir.mkdir(nvim_dir)
  end

  nvim_conf = File.expand_path('~/.config/nvim/init.vim')
  vimrc = File.expand_path('vimrc')
  unless File.symlink?(nvim_conf)
    ln_s(vimrc, nvim_conf)
  end
end

desc "Install bundles"
task :install_bundles do
  `git submodule init`
  `git submodule update`
  puts 'Please install bundles by executing:'
  puts 'vim -u ~/.vim/bundles.vim +BundleInstall +q'
end

desc "Update .vim repository"
task :update do
  `git pull`
  `git submodule update`
end

desc "Update bundles"
task :update_bundles do
  puts 'Please update bundles by executing:'
  puts 'vim -u ~/.vim/bundles.vim +BundleUpdate +q'
end

desc "Install everything"
task :install => [:link_config_files,
                  :install_bundles]

desc "Update everything"
task :default => [:update,
                  :update_bundles]
