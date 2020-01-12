ROOT_PATH = File.expand_path(File.join(File.dirname(__FILE__)))

desc "Link vim configuration files"
task :link_config_files do
  Dir['vimrc'].each do |file|
    dest = File.expand_path("~/.#{file}")
    unless File.exist?(dest)
      ln_s(File.expand_path(file), dest)
    end
  end
end

desc "Install bundles"
task :install_bundles do
  `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
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
