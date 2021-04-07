
def new_savings_goal
    user = {
        username: "", income: 0, accounts: [], savings: [],
        }
    puts "Create a custom savings goal. The savings goal can be anything you like for example deposit on a house, a holiday or a car."
    savings_goal_name = ""
    input = gets.chomp.downcase
    if input == "yes" 
        puts "Do you want to create a savings goal? (yes/no)"

        puts "What is the name of your savings goal?"
        savings_goal_name = gets.chomp

        # Get users savings goal amount
        puts "Now enter an amount you'd like to contribute. Simply enter 0 if you do not want to contribute any funds just yet. You can also come back to this at a later stage."
        savings_contribution = gets.chomp.to_f
        user[:savings] << savings_goal_name
        user[:savings] << savings_contribution
    elsif input == "no"
        
    end
    finished = true
end
new_savings_goal()

=begin
def savings_projection_calculator()
    puts "How much money would you like to save?"
    savings_goal = gets.chomp.to_f
    puts "how much money can you contribute to your goal?"
    contribution_amount = gets.chomp.to_f
    puts "how often can you contribute $#{savings_goal} to your goal? weekly, fortnightly or monthly?"
    contribution_duration = gets.chomp.downcase
    savings_message = "It will take you #{goal_duration} weeks to save $#{savings_goal}"
    if contribution_duration == "weekly"
        goal_duration = savings_goal / contribution_amount * 1
        puts message
    elsif contribution_duration == "fortnightly"
        goal_duration = savings_goal / contribution_amount * 2
        puts savings_message
    elsif contribution_duration == "monthly"
        goal_duration = savings_goal / contribution_amount
        puts "It will take you #{goal_duration} months to save $#{savings_goal}"
    end
end

=end




