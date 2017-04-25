
students = [
    "Dr. Hannibal Lecter",
    "Darth Vader",
    "Nurse Ratched",
    "Michael Corleone",
    "Alex DeLarge",
    "The Wicked Witch of the West",
    "Terminator",
    "Freddy Krueger",
    "The Joker",
    "Joffrey Baratheon",
    "Norman Bates"
    ]
    
# print header method
def print_header
    puts "The students of the Villan Academy"
    puts "---------------"
end 

# print student names method
def print(names)
    names.each do |name|
        puts name
    end
end 

# print total number method
def print_footer(names)
    puts "Overall, we have #{names.count} great students"
end

#calling the methods here
print_header
print(students)
print_footer(students)