

# TBT require_relative 'classes/'

leave = false
profile = []

# Welcome message
def separator(character="_")
    puts character * 76
end
separator()
puts "\n \t \t \t Welcome to Pennyful ! \n"
separator()
puts "Pennyful is an application to help you track expenses and create savings goals. \n"
puts "Lets get started! \n \n"
puts "You can create a profile or choose an existing one. "
puts "Please enter one of the following options:" 
puts "> Profile" 
puts "> New user"

# Until user chooses exit
# Prompt user to log in
# Check user details against CSV file
# Once logged in display menu to user

until leave
    input = gets.chomp.downcase
    if input == "new user"
        puts "Welcome, please enter a profile name. This will then become the name you use to log in."
  

    end

    leave = true
        puts "Thank you for using Pennyful! Have a nice day."
end



