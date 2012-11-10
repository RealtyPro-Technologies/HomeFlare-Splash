require 'bundler/capistrano'

server "homeflareapp.com", :app, :web, :db, :primary => true

default_run_options[:pty] = true
set :application, "HomeFlare-Splash"
set :local_repository,  "git@github.com:RealtyPro-Technologies/HomeFlare-Splash.git"
set :repository,  "git@web.github.com:RealtyPro-Technologies/HomeFlare-Splash.git"


set :scm, :git
set :branch, "master"
set :git_enable_submodules, 1

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :deploy_to, "~/web"
set :user, "homeflar"
set :use_sudo, false

# Load RVM's capistrano plugin.

set :rvm_type, :system
set :rvm_ruby_string, '1.9.3-p194@realtypro'

require "rvm/capistrano"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end