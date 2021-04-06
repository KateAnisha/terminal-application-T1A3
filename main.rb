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

leave = false
until leave
    input = gets.chomp.to_i
    case input
    when 1
        puts "To begin, enter a custom category."
        user_category = custom_categories()
        puts "Category has been created"

    when 2
        puts "Please enter your expenses"

    when 3
        puts "Please enter your savings"
      
        savings_name = savings(savings_name)

    when 4
        separator()
        puts "\n \t \t \t Savings calculator"
        separator()
        puts "\n "
        puts "If you are saving for a specific amount of money, this calculator will assist you in determining how long it will take you to reach your goal"
        until input == " "
            run_calculator = savings_projection_calculator()
            puts "If you are finished, enter done. If you want to run the calculator again, press enter to continue"
            input = gets.chomp 
        end
        
    when 5
        puts "Export to excel"

    when input == "leave"
    end
    leave = true
end
   
