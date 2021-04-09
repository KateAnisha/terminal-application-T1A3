require_relative 'methods'
require 'csv'
# Ruby Gems used in file
require 'colorize'
require 'tty-pie'

profiles = CSV.open("profiles.csv", "r").read
p profiles

leave = false
user = {
    username: "user1", income: 500, accounts: [{name: "food", balance: 0}, {name: "bills", balance: 44.00}], savings: [],
    }

# Begin login/Profile creation
until leave
    loggedin = false
    until loggedin == true
        puts "Welcome to Pennyful. "
        puts "Please choose from the following options:"
        puts "> New profile"
        puts "> Login"
        # input = "new profile"
        input = gets.chomp.downcase
        if input == "new profile"
            profile_is_available = false
            until profile_is_available
                puts "Please enter a name. You will use this name to access your accounts."
                profile_name = gets.chomp
                if profiles.find {|profile| profile[0] == profile_name}
                    puts "that username is taken"
                else 
                    user[:username] = profile_name 
                    user[:income] = 0 
                    user[:accounts] = [] 
                    user[:savings] = [] 
                    profiles.push([user[:username],0,[],[]])
                    profile_is_available = true
                    loggedin = true
                end
            end
            # If profile name already exists
            # request user choose another name
            
        elsif input == "login"
            # open CSV file
            # Search for users name
            # If match found, return logged in
            # Else, tell user profile does not exist & get them to log in
            puts "What is your profile name?"
            profile_name = gets.chomp
            # Find user in profiles
            # Currernt user = values
            found_user = profiles.find {|profile| profile[0] == profile_name}
            if found_user
                user[:username] = found_user[0]
                user[:income] =  found_user[1].to_f
                accounts =  found_user[2].split("|")
                accounts.each do |account|
                    acc = account.split("^")
                    user[:accounts].push({name:acc[0], balance:acc[1].to_f})
                end
                puts user[:accounts]
                user[:savings] = found_user[3].split("|")
                puts user[:accounts]
                loggedin = true
            else
                puts "Profile doesn't exist."
            end
        end
    end
    p user
    puts "What would you like to do now?" 
    puts "Please enter the item number that corresponds with the menu option. (1 - 5)"
    puts "1. Set up income and expense accounts"
    puts "2. Record expenditure"
    puts "3. Manage savings"
    puts "4. Savings projection calculator"
    puts "5. Export to graph"
    
    input = gets.chomp.to_i
    case input
    when 1
        until input == "d"
            puts "What would you like to do?"
            puts "a. Deposit to income account"
            puts "b. Create accounts"
            puts "c. View accounts"
            puts "d. Back to main-menu."
            input = gets.chomp
            if input == "a"
                puts "How much would you like to deposit to your income account? This is where you will deposit any earnings such as salary."
                salary = gets.chomp.to_f
                puts "Awesome #{user[:username]}, you just contributed $#{salary} to your income account."
                user[:income] += salary
                puts "Your income account balance is: $#{user[:income]}"
            elsif input == "b"
                puts "Create custom accounts here."
                puts "For example, you could create an account called food, bills or health."
                puts "Any expenditure will go against these accounts."
                # Pushing users hash with savings goal and balance to the user hash. Pushing into the key of the savings hash called savings.
                puts "Enter an account name"
                custom_account = gets.chomp.downcase
                user[:accounts] << custom_account
                p user[:accounts]
            elsif input == "c"
                puts "You have the following accounts:"
                # Iterate over accounts
                # Return accounts in the following format
                # Account name : custom_account
                # Expenditure total:  
                puts user[:accounts]
            end
        end
    when 2
        puts "You have the following accounts:"
        # List accounts
        if user[:accounts].empty? == false
            puts user[:accounts]
            puts "What account would you like to enter expenses towards?"
            input = gets.chomp.downcase
            puts "How much did you spend?"
            expense_amount = gets.chomp.to_f
            index = user[:accounts].find_index {|element| element[:name] == input}
            user[:income] -= expense_amount # input from user
            user[:accounts][index][:balance] += expense_amount
            p user
            gets
        else
            puts "You don't have any accounts to add expenses to"
            puts "Press enter to return to main menu..."
            gets.chomp
        end
    when 3
        until input == "d"
        puts "Here you can manage your Pennyful! Savings."
        puts "What would you like to do?" 
        puts "Please enter the item number that corresponds with the menu option. (a - d)"
        puts "a. New Savings Goal"
        puts "b. View savings"
        puts "c. Contribute to savings"
        puts "d. Main Menu"
        input = gets.chomp.downcase
            if input == "a"
                puts "Set up a new savings goal"
                run_savings_goal = new_savings_goal()
                p user[:savings]
            elsif input == "b"
                puts "View savings goal"
                # Print savings accounts and current values to screen
            elsif input == "c"
                puts "Contribute to savings"
                # Find account
                # Create index (empty variable) then locates list of users & the savings key. Calls the find_index method on the hash. 
                # index = user[:savings].find_index {|element| element[:savings_goal] == input}
                # user[:savings][index][:balance] -= 50
                # p result
            end
        end
    when 4
        separator()
        puts "\n \t \t \t Savings calculator"
        separator()
        puts "\n "
        puts "If you are saving for a specific amount of money, this calculator will assist you in determining how long it will take you to reach your goal"
        until input == "done"
            run_calculator = savings_projection_calculator()
            puts "If you are finished, enter done. If you want to run the calculator again, press enter to continue"
            input = gets.chomp 
        end
        
    when 5
        puts "Export to pie graph"
        data = []
        
        # iterate over the user accounts
        user[:accounts].each do |account|
            colors = [:blue, :yellow, :green, :white, :red]
            fills = ["*", "&", "^", "%", "$"]
            p account
            # create a temp hash
            temp_hash = {}
            # store the name of the qccount as name in the temp hash
            temp_hash[:name] = account[:name]
            temp_hash[:balance] = account[:value]
            p account
            temp_hash[:color] = colors[0]..[4].sample
            # temp_hash[:fills] = fills[].sample
            p account
            # store the color as a random color in the temp hash
            # store the fill as a random fill in the temp hash
        end
        # Assign key to hash 
        # push the temp hash to data
        gets
        # p data
        # pie_chart = TTY::Pie.new(data: data, radius: 5)
        # print pie_chart
        
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