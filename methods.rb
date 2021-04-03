
# NEW USER
# look through profiles array for users profile name. 
# If the profile is found, return profile taken
# Else add profile to ARRAY of profiles. 

def new_profile()
    puts "Welcome, please enter a profile name. This will then become the name you use to view your profile."
    profile_name = gets.chomp.downcase
end
def find_profile?(profile_name)
    profiles = ["kate"]
    profiles.each do |profile|
        if profile == profile_name
            puts "Sorry that profile name is taken, please choose another."
        elsif profile != profile_name
            profiles << profile_name.push
            puts "Welcome #{profile_name}."
            print profiles
        end
    end
end


