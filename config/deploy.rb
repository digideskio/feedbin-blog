set :rbenv_type, :system
set :rbenv_ruby, '2.0.0-p247'

set :application, 'feedbin-blog'
set :repo_url, 'git@github.com:feedbin/feedbin-blog.git'

set :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, '/srv/apps/feedbin-blog'
set :scm, :git

set :bundle_bins, fetch(:bundle_bins, []).push(%w{jekyll})

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app) do
      execute "cd #{current_path} && JEKYLL_ENV=hosted jekyll build"
    end
  end

  after :finishing, 'deploy:cleanup'

end
