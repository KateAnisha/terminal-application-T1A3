class Finances 
    def intitalize(name)
        @name = name
        @category_name = []
        @transactions = []
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
end

# category = Finances.new()
# category.custom_categories("Food")







# def add_expense(description, amount)
#     @expense_description.push(description: description, amount: amount)
# end