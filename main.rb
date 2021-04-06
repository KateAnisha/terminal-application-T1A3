require 'csv'
require 'colorize'

user = {
    username: "", income: 0, savings: [],
    }

puts "Welcome to Pennful. "
puts "please choose from the following"
puts "> New profile"
puts "> Existing profile"


puts "Please enter a name. You will use this name to access your accounts."
account_name = gets.chomp
user[:username] << account_name

puts "Hi #{account_name}."
puts "We have set you up with an income account. This is where you will enter any earnings such as wages."
puts "To get started, please enter your salary."
# Get users salary 
# Push users salary to user hash with key called income. 
salary = gets.chomp.to_i
user[:income] << salary

# Set up users custom savings goal
puts "Create a custom savings goal. The savings goal can be anything you like for example deposit on a house, a holiday or a car."
savings_goal_name = gets.chomp

# Get users savings goal amount
puts "Now enter an amount you'd like to contribute. Simply enter 0 if you do not want to contribute any funds just yet. You can also come back to this at a later stage."
savings_contribution = gets.chomp.to_i
user[:savings] << savings_goal_name
user[:savings] << savings_contribution
p user
# user[:savings] << {savings_goal: "Car", balance: 3000}

# Make hash with layout (name and balance) 
# Value of name will be what they type in


# how to find user
# index = user[:username].find_index {|element| element[:name] == input}



# pushing users hash with savings goal and balance to the user hash. Pushing into the key of the savings hash called savings.
user[:savings] << {savings_goal: "Holiday", balance: 500}
user[:savings] << {savings_goal: "House", balance: 10000}
p user
input = "Car"

# Find account
# Create index (empty variable) then locates list of users & the savings key. Calls the find_index method on the hash. 
index = user[:savings].find_index {|element| element[:savings_goal] == input}
user[:savings][index][:balance] -= 50
# p result

# # Transfer incocme to savings a/c
# result[:balance] -= 50
p user
# p result



=begin
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

=end
   
