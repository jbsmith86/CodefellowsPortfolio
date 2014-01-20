namespace :server do
  desc "TODO"
  task restart: :environment do
    `cd /var/www/jbs`
    `PID=$(cat /var/www/jbs/tmp/pids/unicorn.pid)`
    `kill -9 $PID`
    `bundle exec unicorn -c /var/www/jbs/config/unicorn.rb -d -E production -D`
    `/etc/init.d/nginx restart`
  end

  desc "TODO"
  task compile: :environment do
    `cd /var/www/jbs`
    `PID=$(cat /var/www/jbs/tmp/pids/unicorn.pid)`
    `kill -9 $PID`
    `/etc/init.d/nginx stop`
    `rake assets:precompile RAILS_ENV=production`
    `rake db:migrate RAILS_ENV=production`
    `bundle install RAILS_ENV=production`
    `bundle exec unicorn -c /var/www/jbs/config/unicorn.rb -d -E production -D`
    `/etc/init.d/nginx start`
  end
end
