set :use_sudo,            false
set :git_shallow_clone,   1
set :keep_releases,       5
set :application,         "shop"
set :user,                "deployer"
set :password,            "12345"
set :deploy_to,           "/home/deployer/shop"
set :runner,              "deployer"
set :repository,          "git@github.com:alessandroasac/linuxfi-loja.git"
set :scm,                 :git
set :real_revision,       lambda { source.query_revision(revision) {
    |cmd| capture(cmd) } }

ssh_options[:paranoid]    = false
default_run_options[:pty] = true

role :app, "184.106.218.226"
role :web, "184.106.218.226"
role :db,  "184.106.218.226", :primary => true

namespace :deploy do

  task :start do
    sudo "/etc/init.d/unicorn start"
  end

  task :start do
    sudo "/etc/init.d/unicorn stop"
  end

  task :restart do
    sudo "/etc/init.d/unicorn reload"
  end

end