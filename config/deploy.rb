# config valid only for current version of Capistrano
lock '3.3.4'

set :application, 'kamilkowalski'
set :repo_url, 'git@github.com:kamilkowalski/kamilkowalski.git'

namespace :passenger do
  desc "Restart app"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

after :deploy, "passenger:restart"
