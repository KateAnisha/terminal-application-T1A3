echo "Preparing files for installation..."
rm Gemfile.lock
touch profiles.csv
bundle install
echo "Gems ready... now running application"
ruby main.rb
