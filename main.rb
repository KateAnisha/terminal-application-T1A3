require_relative 'methods'

begin
    require 'csv'
    # Ruby Gems used in file
    require 'colorize'
    require 'tty-pie'
    require 'ruby_figlet'
rescue
    puts "Please install required gems by running bundle install"
    exit
end

profiles = CSV.open("profiles.csv", "r").read

leave = false
user = {}

# Begin login/Profile creation
loggedin = false
until leave
    until loggedin == true
        separator()
        puts RubyFiglet::Figlet.new("Welcome to Pennyful").to_s.colorize(:light_blue)
        separator()
        puts "Please choose from the following options:"
        puts "> New profile".colorize(:green)
        puts "> Login".colorize(:green)
        input = gets.chomp.downcase
        if input == "new profile"
            profile_is_available = false
            until profile_is_available
                puts "Please enter a name. You will use this name to access your accounts."
                profile_name = gets.chomp
                if profiles.find {|profile| profile[0] == profile_name}
                    puts "Sorry! that username is taken".colorize(:red)
                else 
                    user[:username] = profile_name 
                    user[:income] = 0 
                    user[:accounts] = []
                    profiles.push([user[:username],0,""])
                    profile_is_available = true
                    loggedin = true
                end
            end     
        # Login section   
        elsif input == "login"
            puts "What is your profile name?"
            profile_name = gets.chomp
            found_user = profiles.find {|profile| profile[0] == profile_name}
            if found_user
                user[:username] = found_user[0]
                user[:income] =  found_user[1].to_f
                accounts =  found_user[2].split("|")
                user[:accounts] = []
                accounts.each do |account|
                    acc = account.split("^")
                    user[:accounts].push({name:acc[0], balance:acc[1].to_f})
                end
                loggedin = true
            else
                puts "Profile doesn't exist.".colorize(:red)
            end
        end
    end
    # Main menu of program
    puts "What would you like to do now?" 
    puts "Please enter the item number that corresponds with the menu option. (1 - 5)"
    puts "1. Set up income and expense accounts"
    puts "2. Record expenses"
    puts "3. Savings projection calculator"
    puts "4. Export to graph"
    puts "5. Exit application"
    
    input = gets.chomp.to_i
    case input
    when 1
        # Manage accounts section
        until input == "d"
            separator()
            puts RubyFiglet::Figlet.new("Manage Accounts").to_s.colorize(:light_blue)
            separator()
            # Sub-menu
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
                puts "Enter an account name"
                custom_account = gets.chomp.downcase
                custom_account = {name: custom_account, balance: 0}
                user[:accounts] << custom_account 
            elsif input == "c"
                puts "You have the following accounts:"
                print user[:accounts]
            end
        end
    when 2
        # Record expenses
        puts "You have the following accounts:"
        # Run record expenses function
        list_accounts(user)
    when 3
        puts RubyFiglet::Figlet.new("Savings Calculator").to_s.colorize(:light_blue)
        puts "If you are saving for a specific amount of money, this calculator will assist you in determining how long it will take you to reach your goal"
        until input == "done"
            run_calculator = savings_projection_calculator()
            puts "If you are finished, enter done. If you want to run the calculator again, press enter to continue".colorize(:red)
            input = gets.chomp 
        end
        
    when 4
        # Output accounts to pie chart
        puts RubyFiglet::Figlet.new("Pie Chart").to_s.colorize(:light_blue)
        data = []
        # iterate over the user accounts
        user[:accounts].each do |account|
            colors = [:blue, :yellow, :green, :white, :red, :bright_cyan, :bright_magenta]
            fills = ["*", "&", "^", "%", "$"]
            # create a temp hash
            temp_hash = {}
            # store the name of the account as name in the temp hash
            temp_hash[:name] = account[:name]
            temp_hash[:value] = account[:balance]
            # store the color as a random color in the temp hash
            temp_hash[:color] = colors.slice!(rand(0..colors.length-1))
            # store the fill as a random fill in the temp hash
            temp_hash[:fill] = fills.slice!(rand(0..fills.length-1))
            # temp_hash[:fills] = fills[].sample
            # push the temp hash to data
            data << temp_hash
        end
        # Run pie chart using TTY Pie 
        pie_chart = TTY::Pie.new(data: data, radius: 5)
        print pie_chart
        puts "Press enter to contine"
        gets.chomp
    when 5
        leave = true
    end
end

# Update CSV
index = profiles.find_index { |profile| user[:username] == profile[0]}
user_to_array = []
user.each {|key, val| 
    if key == :accounts
        string = ""
        user[:accounts].each {|hash|
            p hash
            hash.each { |subkey, subval| 
                string += "#{subkey}^#{subval}|"
            }
        }
        string.delete_suffix!("|")
        
        user_to_array.push(string)
    else 
        user_to_array.push(val.to_s)
    end
}

profiles[index] = user_to_array

CSV.open("profiles.csv", "w") do |csv|
end

CSV.open("profiles.csv", "a") do |csv|
    profiles.each { |p|
        csv << [p[0], p[1], p[2], p[3]]
    }
end
