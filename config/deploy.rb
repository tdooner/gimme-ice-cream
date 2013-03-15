ssh_options[:forward_agent] = true
ssh_options[:keys] = %w(~/.ssh/id_rsa.pub)

set :application, "Gimme Ice Cream"
set :repository,  "git@github.com:ted27/gimme-ice-cream.git"
set :user, 'ice-cream'
set :use_sudo, false

set :scm, :git

role :web, "acm-projects.case.edu"                          # Your HTTP server, Apache/etc
role :app, "acm-projects.case.edu"                          # This may be the same as your `Web` server
role :db,  "acm-projects.case.edu", :primary => true # This is where Rails migrations will run

set :deploy_to, '/srv/ice-cream'

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
