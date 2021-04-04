class Finances 
    def intitalize(name)
        @name = name
        @category_name = []
        @transactions = []
        @savings_account_name = savings_account_name
        @savings = []
    end

    def custom_categories(category_name)
        puts "Please enter a category for your transaction. E,g, Food, Income, General Expense, Health."
        puts "This can be anything you like"
        @category_name = gets.chomp.downcase
        puts @category_name
    end

    def add_expenses(description, amount)
        @transactions.push(description: description, amount: amount)
    end

    def saving(savings_name)
        @savings << savings_amount
        puts "Please enter a name for your savings account."
        puts "This can be anything you like"
        @savings_account_name = gets.chomp.downcase
        savings_ammount = gets.chomp.to_i
    end

        # Set empty array
        # Get users name for savings a/c and push to array
        # Get users input for initial savings amount. 
        # Deduct savings from income a/c ?
        # Display balance to user.
end







# def add_expense(description, amount)
#     @expense_description.push(description: description, amount: amount)
# end