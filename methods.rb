
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




