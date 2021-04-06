require_relative 'classes/finance'
require_relative 'methods'
require 'csv'
require 'colorize'

# Welcome message
def separator(character="_")
    puts character * 76
end
separator()
puts "\n \t \t \t Welcome to Pennyful ! \n"
separator()
puts "Pennyful is an application to help you track expenses and create savings goals. \n"
puts "Lets get started! \n \n"
puts "What would you like to do?" 
puts "Please enter the item number that corresponds with the menu option. (1 - 5)"
puts "1. Set up expense categories"
puts "2. Record expenditure"
puts "3. View savings"
puts "4. Savings projection calculator"
puts "5. Export to excel"