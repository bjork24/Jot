require "bundler/capistrano"

set :application, "danchilton.com"

set :port, 2424
set :ssh_options, { :forward_agent => true }

# Deploy from your local Git repo by cloning and uploading a tarball
set :scm, :git
set :repository,  "."
set :deploy_via, :copy

set :user, :deploy
set :deploy_to, "/var/www/danchilton_subs/jot"
set :use_sudo, false

role :web, application
role :app, application
role :db,  application, :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  desc "Symlinks the database.yml"
  task :symlink_db, :roles => :app do
    run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
  end
end

after 'deploy:update_code', 'deploy:symlink_db'
after "deploy:restart", "deploy:cleanup"