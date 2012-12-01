# RVM bootstrap
set :rvm_ruby_string, '1.9.2-p320@lauyon-cms'
require "rvm/capistrano"                               # Load RVM's capistrano plugin.

# When using whenever gem:
# set :whenever_command, "bundle exec whenever"
# require 'whenever/capistrano'

set :rvm_type, :system

# bundler bootstrap
require 'bundler/capistrano'

# main details
set :application, "lauyon-cms"
role :web, "patrickbaselier.nl"
role :app, "patrickbaselier.nl"
role :db,  "patrickbaselier.nl", :primary => true

# server details
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :deploy_to, "/var/www/lauyon-cms"
set :deploy_via, :remote_cache
set :user, "passenger"
set :use_sudo, false

# repo details
set :scm, :git
set :scm_username, "passenger"
set :repository, "git@github.com:bazzel/lauyon-cms.git"
set :branch, "master"
set :git_enable_submodules, 1

# tasks
namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Symlink shared resources on each release - not used"
  task :symlink_shared, :roles => :app do
    #run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

# FaviconMaker
# See also: https://github.com/follmann/favicon_maker
require 'favicon_maker'

namespace :favicon do
  task :create_versions do
    options = {
      :root_dir => release_path,
      :input_dir => File.join('app', 'assets', 'public'),
      :output_dir => 'public'
    }
    FaviconMaker::Generator.create_versions(options) do |filepath|
      puts "Created favicon: #{filepath}"
    end
  end
end

after 'deploy:update_code', 'favicon:create_versions'

after 'deploy:update_code', 'deploy:symlink_shared'
after "deploy:restart", 'deploy:cleanup'

load 'deploy/assets'
