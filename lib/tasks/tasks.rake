namespace :heroku do
  APP = ENV['APP'] unless defined?(APP)

  def run(*cmd)
    system(*cmd)
    raise "Command #{cmd.inspect} failed!" unless $?.success?
  end

  def confirm(message)
    print "\n#{message}\nAre you sure? [yN] "
    raise 'Aborted' unless STDIN.gets.chomp.downcase == 'y'
  end

  desc "Deploy app to Heroku"
  task :deploy do
    puts "-----> Pushing..."
    run "git push git@heroku.com:#{APP}.git HEAD:master -f"

    puts "-----> Migrating..."
    Bundler.with_clean_env { run "heroku run rake db:migrate --app #{APP}" }

    puts "-----> Seeding..."
    Bundler.with_clean_env { run "heroku run rake db:seed --app #{APP}" }

    puts "-----> Restarting..."
    Bundler.with_clean_env { run "heroku restart --app #{APP}" }
  end
end
