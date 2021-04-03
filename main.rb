require_relative "classes/finance"
require_relative "methods"
require 'csv'

# Welcome message
def separator(character="_")
    puts character * 76
end
separator()
puts "\n \t \t \t Welcome to Pennyful ! \n"
separator()
puts "Pennyful is an application to help you track expenses and create savings goals. \n"
puts "Lets get started! \n \n"
puts "You can create a profile or choose an existing one. "
puts "Please enter one of the following options:" 
puts "> Profile" 
puts "> New user"

# Until user chooses leave

leave = false
done = false
=begin
until leave
    until done
        input = gets.chomp.downcase
        if input == "new user"
            profile_name = new_profile()
            profile_taken = find_profile?(profile_name)
        elsif input == "profile"
        end
        done = true
    end
    leave = true
    #     puts "Thank you for using Pennyful! Have a nice day."
end

=end

# Menu items
puts "What would you like to do?" 
puts "Please enter the item number that corresponds with the menu option."
puts "1. Enter income"
puts "2. Record expenditure"
puts "3. View savings"
puts "4. Savings projection calculator"
puts "5. Export to excel"

input = gets.chomp.to_i
case input
when "exit"
    leave = true

when 1
    puts "Please enter your income"

when 2
    puts "Please enter your expenses"

when 3
    puts "Please enter your savings"

when 4
    puts "Savings calculator"

when 5
    puts "Export to excel"

end
