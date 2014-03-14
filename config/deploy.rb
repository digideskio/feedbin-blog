set :rbenv_type, :system
set :rbenv_ruby, '2.0.0-p247'

set :application, 'feedbin-blog'
set :repo_url, 'git@github.com:feedbin/feedbin-blog.git'

set :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, '/srv/apps/feedbin-blog'
set :scm, :git

namespace :deploy do

  desc 'jekyll build'
  task :publishing do
    on roles(:app), in: :sequence, wait: 5 do
      execute "cd #{current_path} && JEKYLL_ENV=hosted /usr/local/rbenv/shims/bundle exec jekyll build"
    end
  end

end
