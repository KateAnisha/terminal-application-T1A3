
puts "Welcome to Pennful. "
puts "To get started, enter your name"

user = {username: ""}
user = {
    username: "Kate", income: 500, savings: []
    
    }

account_name = gets.chomp.downcase
user[:username] << account_name



# Ask user what name is
# Get name
# Make hash with layout (name and balance) 
# Value of name will be what they type in

user[:savings] << {savings_goal: "Holiday", balance: 500}
user[:savings] << {savings_goal: "House", balance: 10000}
user[:savings] << {savings_goal: "Car", balance: 3000}
p user
input = "Car"

# Find
index = user[:savings].find_index {|element| element[:name] == input}
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
   
