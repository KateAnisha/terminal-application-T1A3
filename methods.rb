def new_savings_goal
    puts "Create a custom savings goal. The savings goal can be anything you like for example deposit on a house, a holiday or a car."
    puts "Do you want to create a savings goal? (yes/no). If you choose no, you will return to the previous menu."
    savings_goal_name = " "
    input = gets.chomp.downcase
    if input == "yes" 
        puts "What is the name of your savings goal?"
        savings_goal_name = gets.chomp
        # Get users savings goal amount
        puts "Now enter an amount you'd like to contribute. Simply enter 0 if you do not want to contribute any funds just yet. You can also come back to this at a later stage."
        savings_contribution = gets.chomp.to_f
        user[:savings] << savings_goal_name
        user[:savings] << savings_contribution
        p user[:savings]
    elsif input == "no"
        #return user to main menu
    end
end

def account_manage(user)
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

def list_accounts(user)
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
end

def savings_projection_calculator()
    puts "How much money would you like to save?"
    savings_goal = gets.chomp.to_f
    puts "how much money can you contribute to your goal?"
    contribution_amount = gets.chomp.to_f
    puts "how often can you contribute $#{savings_goal} to your goal? weekly, fortnightly or monthly?"
    contribution_duration = gets.chomp.downcase
    if contribution_duration == "weekly"
        goal_duration = savings_goal / contribution_amount * 1
        puts "It will take you #{goal_duration} weeks to save $#{savings_goal}"
    elsif contribution_duration == "fortnightly"
        goal_duration = savings_goal / contribution_amount * 2
        puts "It will take you #{goal_duration} weeks to save $#{savings_goal}"
    else contribution_duration == "monthly"
        goal_duration = savings_goal / contribution_amount
        puts "It will take you #{goal_duration} months to save $#{savings_goal}"
    end
end





