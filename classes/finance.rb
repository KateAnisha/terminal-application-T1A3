class Finances 
    attr_reader :savings
    @savings
    def intitalize(name)
        @name = name
        @category_name = ["Income"]
        @transactions = []
        @savings_account_name = savings_account_name
        @savings = []
    end

    def custom_categories(category_name)
        puts "Please enter a category for your transaction. E,g, Food, Income, General Expense, Health." #Prompt user to create a category
        puts "This can be anything you like"
        @category_name = gets.chomp.downcase #Get users category name & store in category variable
        puts @category_name # Print categories to the screen
        @category_name.push(category_name) #Push category name to category hash 
    end

    def add_expenses(description, amount)
        @transactions.push(description: description, amount: amount)
    end

    def savings(savings_name) # Define savings method
        puts "Manage your Pennyful! Savings."
        puts "What would you like to do?" 
        puts "Please enter the item number that corresponds with the menu option. (1 - 5)"
        puts "1. New Savings Goal"
        puts "2. View savings"
        puts "3. Contribute to savings"

        input = gets.chomp.to_i
        case input
        when 1
            puts "Please enter a name for your savings goal." # Request savings goal from user
            puts "This can be anything you like e.g. New car, House deposit"
            @savings_account_name = gets.chomp.downcase # Get users input and push to savings_account_name variable
            puts "Awesome! You just created a savings account called #{@savings_account_name}." 
            puts "Would you like to make a contribution? (y/n)?"
            answer gets.chomp.downcase
            if answer == "y"
                puts "Please enter an amount you would like to contribute. Numbers only!"
                puts "Please note this will be deducted from your income account."
                savings_contribution_amount = gets.chomp.to_i
                puts "You have just contributed $#{savings_contribution_amount}.00 to your savings"
                @savings << savings_contribution_amount
            elsif answer == "n"
                
            end
            
        when 2
            puts "Your savings balance is #{@savings}.00"

        when 3
            puts "Please enter an amount you would like to contribute. Numbers only!"
            puts "Please note this will be deducted from your income account."
            savings_contribution_amount = gets.chomp.to_i
            puts "You have just contributed $#{savings_contribution_amount}.00 to your savings"
            @savings << savings_contribution_amount
            puts "Your #{@savings_account_name} balance is now $#{@savings.sum}.00"

        end
    end

    

        # Set empty array
        # Get users name for savings a/c and push to array
        # Get users input for initial savings amount. 
        # Deduct savings from income a/c ?
        # Display balance to user.
end

account = Finances.new
account.savings("new car")




# def add_expense(description, amount)
#     @expense_description.push(description: description, amount: amount)
# end