namespace :server do
  desc "TODO"
  task restart: :environment do
    system 'PID=$(cat /var/www/jbs/tmp/pids/unicorn.pid)'
    system 'kill -9 $PID'
    system 'cd /var/www/jbs; bundle exec unicorn -c /var/www/jbs/config/unicorn.rb -d -E production -D'
    system '/etc/init.d/nginx restart'
  end

  desc "TODO"
  task compile: :environment do
    system 'PID=$(cat /var/www/jbs/tmp/pids/unicorn.pid)'
    system 'kill -9 $PID'
    system '/etc/init.d/nginx stop'
    system 'cd /var/www/jbs; rake assets:precompile RAILS_ENV=production'
    system 'cd /var/www/jbs; rake db:migrate RAILS_ENV=production'
    system 'cd /var/www/jbs; bundle install'
    system 'cd /var/www/jbs; bundle exec unicorn -c /var/www/jbs/config/unicorn.rb -d -E production -D'
    system '/etc/init.d/nginx start'
  end
end
