echo "Preparing files for installation..."
rm Gemfile.lock
touch profiles.csv
bundle install
echo "Gems and files ready... now running application."
ruby main.rb
