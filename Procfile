web: bundle exec puma -C config/puma.rb
js: yarn build
css: bin/rails assets:precompile
release: bundle exec rails db:migrate
clockwork: bundle exec clockwork clock.rb
solid_queue: bundle exec rake solid_queue:start