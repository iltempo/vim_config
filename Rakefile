ROOT_PATH = File.expand_path(File.join(File.dirname(__FILE__)))

desc "Update submodules"
task :update_submodules do
  `git submodule update --init`
end

desc "Link vim/macvim configuration files"
task :link_config_files do
  Dir['{g,}vimrc.*'].each do |file|
    dest = File.expand_path("~/.#{file}")
    unless File.exist?(dest)
      ln_s(File.expand_path(file), dest)
    end
  end
end

desc "Link plugins"
task :link_plugins do
  dest = File.expand_path("~/.janus")
  unless File.exist?(dest)
    ln_s(File.expand_path('plugins'), dest)
  end
end

desc "Install Janus"
task :install_janus do
  unless Dir.exists?(File.expand_path("~/.vim/janus"))
    `curl -Lo- https://bit.ly/janus-bootstrap | bash`
  end
end

desc "Update Janus"
task :update_janus do
  `cd ~/.vim && rake update`
end

desc "Install everything"
task :install => [
  :update_submodules,
  :link_config_files,
  :link_plugins,
  :install_janus]

desc "Link config files"
task :default => [:update_submodules,
  :update_janus]
