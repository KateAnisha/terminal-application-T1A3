require 'csv'
# require 'colorize'
require_relative 'methods'
profiles = CSV.open("profiles.csv", "r").read
p profiles

leave = false
user = {
    username: "", income: 0, accounts: [], savings: [],
    }
    
until leave
    loggedin = false
    until loggedin == true
        puts "Welcome to Pennful. "
        puts "Please choose from the following options:"
        puts "> New profile"
        puts "> Login"
        input = "new profile"
        # input = gets.chomp.downcase
        if input == "new profile"
            profile_is_available = false
            until profile_is_available
                puts "Please enter a name. You will use this name to access your accounts."
                profile_name = gets.chomp
                if profiles.select {|profile| profile[0] == profile_name} != []
                    puts "that username is taken"
                else 
                    user[:username] = profile_name 
                    user[:income]
                    profiles.push([user[:username],0,[],[]])
                    profile_is_available = true
                    loggedin = true
                end
            end
            # If profile name already exists
            # request user choose another name
            
        elsif input == "login"
            #open CSV file
            # Search for users name
            # If match found, return logged in
            # Else, tell user profile does not exist & get them to log in
            puts "What is your profile name?"
            profile_name = gets.chomp
            CSV.foreach("profiles.csv", "r") do |csv|
                if profile_name == user[:username]
                    return loggedin = true
                end
            end  
        end
    end
    puts "What would you like to do now?" 
    puts "Please enter the item number that corresponds with the menu option. (1 - 5)"
    puts "1. Set up income and expense accounts"
    puts "2. Record expenditure"
    puts "3. Manage savings"
    puts "4. Savings projection calculator"
    puts "5. Export to graph"
    
    input = gets.chomp.downcase
    case input
    when 1
        puts "1. Set up income and expense accounts"
        puts "To begin, we have set you up with an income account."
        puts "You can add your own custom accounts as well."
        puts "How much would you like to deposit to your income account? This is where you will deposit any earnings such as salary."
        salary = gets.chomp.to_f
        puts "Awesome #{account_name}, you just contributed $#{salary} to your income account."
        puts "Your income account is at $#{user[:income]}"
        user[:income] =+ salary
    
    when 2
        puts "Please enter your expenses"
    
    when 3
        puts "Here you can manage your Pennyful! Savings."
        puts "What would you like to do?" 
        puts "Please enter the item number that corresponds with the menu option. (1 - 5)"
        puts "1. New Savings Goal"
        puts "2. View savings"
        puts "3. Contribute to savings"
        puts "4. Main Menu"
    
        # Find account
        # Create index (empty variable) then locates list of users & the savings key. Calls the find_index method on the hash. 
        index = user[:savings].find_index {|element| element[:savings_goal] == input}
        user[:savings][index][:balance] -= 50
        # p result
        
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
        puts "Export to graph"
    when "exit"
        leave = true
    end
end





=begin



p user
# user[:savings] << {savings_goal: "Car", balance: 3000}


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

=end

# find the user's old data in profiles
# replace the user's old data with the new data
# overwrite the old csv, with the new profiles_array