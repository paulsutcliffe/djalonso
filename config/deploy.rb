require "bundler/capistrano"
require "rvm/capistrano"

set :rvm_ruby_string, '2.1.2'
set :rvm_type, :user  # Don't use system-wide RVM

server "kosmyka.com", :web, :app, :db, primary: true

set :application, "djalonso"
set :user, "paul"
set :deploy_to, "/var/www/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:paulsutcliffe/#{application}.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases

namespace :deploy do

  task :create_database do
    set :root_password, Capistrano::CLI.password_prompt("MySQL root password: ")
    set :db_user, Capistrano::CLI.ui.ask("Application database user: ")
    set :db_pass, Capistrano::CLI.password_prompt("Password: ")
    set :db_name, Capistrano::CLI.ui.ask("Database name: ")

    run "mysql --user=root --password=#{root_password} -e \"CREATE DATABASE IF NOT EXISTS #{db_name}\""
    run "mysql --user=root --password=#{root_password} -e \"GRANT ALL PRIVILEGES ON #{db_name}.* TO '#{db_user}'@'localhost' IDENTIFIED BY '#{db_pass}' WITH GRANT OPTION\""
  end

  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do
      run "/etc/init.d/unicorn_#{application} #{command}"
    end
  end

  task :setup_config, roles: :app do
    if File.exist? '/etc/nginx/sites-enabled/default'
      sudo "rm /etc/nginx/sites-enabled/default"
    end
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
  end
  before "deploy:cold", "deploy:setup_config"
  before "deploy:cold", "deploy:create_database"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

  desc "Make sure local git is in sync with remote."
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/master`
      puts "WARNING: HEAD is not the same as origin/master"
      puts "Run `git push` to sync changes."
      exit
    end
  end
  before "deploy", "deploy:check_revision"
end
