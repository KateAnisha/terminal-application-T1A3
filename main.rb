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
p profiles

leave = false
user = {}

# Begin login/Profile creation
loggedin = false
until leave
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
                    profiles.push([user[:username],0,""])
                    profile_is_available = true
                    loggedin = true
                end
            end        
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
                puts user[:accounts]
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
    puts "2. Record expenses"
    puts "3. Savings projection calculator"
    puts "4. Export to graph"
    puts "5. Exit application"
    
    input = gets.chomp.to_i
    case input
    when 1
        until input == "d"
            run_accounts = account_manage(user)
        end
    when 2
        puts "You have the following accounts:"
        # List accounts
        list_accounts(user)
        
    when 3
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
        
    when 4

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
        pie_chart = TTY::Pie.new(data: data, radius: 5)
        print pie_chart
        puts "Press enter to contine"
        gets.chomp
    when 5
        leave = true
    end
end

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
