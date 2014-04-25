web:     bundle exec thin start -p $PORT -e $RACK_ENV
worker:  bundle exec rake jobs:work
resque: rake RAILS_ENV=production environment resque:work QUEUE='*'
clock:   bundle exec clockwork app/clock.rb
