desc "Link vim/macvim/tmux configuration files"
task :link_config_files do
  Dir['{g,}vimrc{.*,}', 'tmux.conf'].each do |file|
    dest = File.expand_path("~/.#{file}")
    unless File.exist?(dest)
      ln_s(File.expand_path(file), dest)
    end
  end

  Dir['tmux.local.conf'].each do |file|
    dest = File.expand_path("~/.#{file}")
    unless File.exist?(dest)
      cp(File.expand_path(file), dest)
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

  fish_conf = File.expand_path('~/.config/fish')
  fish_dir = File.expand_path('config/fish/')
  unless File.symlink?(fish_conf)
    ln_s(fish_dir, fish_conf)
  end

  Dir['config.local.fish'].each do |file|
    dest = File.expand_path("~/.config/fish/conf.d/#{file}")
    unless File.exist?(dest)
      cp(File.expand_path(file), dest)
    end
  end

  alacritty_conf_dir = File.expand_path('~/.config/alacritty')
  alacritty_dir = File.expand_path('config/alacritty/')
  unless File.symlink?(alacritty_conf_dir)
    ln_s(alacritty_dir, alacritty_conf_dir)
  end

  git_conf_legacy = File.expand_path('~/.gitconfig')
  if File.exist?(git_conf_legacy)
    puts 'Old git config file exists at ~/.gitconfig. Please remove and run again.'
    exit 1
  end

  git_dir = File.expand_path('~/.config/git/')
  unless Dir.exist?(git_dir)
    Dir.mkdir(git_dir)
  end
  Dir.chdir("config/") do
    Dir['git/*'].each do |file|
      dest = File.expand_path("~/.config/#{file}")
      unless File.exist?(dest)
        ln_s(File.expand_path(file), dest)
      end
    end
  end
end

desc "Install bundles"
task :install_bundles do
  vundle_dir = File.expand_path('~/.vim/bundle/Vundle.vim')
  unless Dir.exist?(vundle_dir)
    `git clone https://github.com/VundleVim/Vundle.vim.git #{vundle_dir}`
  end
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
                  :install]
