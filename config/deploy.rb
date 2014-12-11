# config valid only for current version of Capistrano
lock '3.3.4'

set :application, 'kamilkowalski'
set :repo_url, 'git@github.com:kamilkowalski/kamilkowalski.git'

namespace :deploy do
  desc "Restart app"
  task :restart do
    on roles(:web), wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end
end
