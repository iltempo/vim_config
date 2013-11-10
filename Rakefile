ROOT_PATH = File.expand_path(File.join(File.dirname(__FILE__)))

desc "Link vim/macvim/tmux configuration files"
task :link_config_files do
  Dir['{g,}vimrc{.*,}', 'tmux.conf'].each do |file|
    dest = File.expand_path("~/.#{file}")
    unless File.exist?(dest)
      ln_s(File.expand_path(file), dest)
    end
  end
end

desc "Install bundles"
task :install_bundles do
  `vim +BundleInstall +qall`
end

desc "Update .vim repository"
task :update do
  `git pull`
end

desc "Update bundles"
task :update_bundles do
  `vim +BundleUpdate +qall`
end

desc "Install everything"
task :install => [:link_config_files,
                  :install_bundles]

desc "Update everything"
task :default => [:update,
                  :update_bundles]
