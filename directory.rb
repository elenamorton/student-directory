
students = [
    {name: "Dr. Hannibal Lecter", cohort: :november},
    {name: "Darth Vader",  cohort: :november},
    {name: "Nurse Ratched", cohort: :november},
    {name: "Michael Corleone", cohort: :november},
    {name: "Alex DeLarge", cohort: :november},
    {name: "The Wicked Witch of the West", cohort: :november},
    {name: "Terminator", cohort: :november},
    {name: "Freddy Krueger", cohort: :november},
    {name: "The Joker", cohort: :november},
    {name: "Joffrey Baratheon", cohort: :november},
    {name: "Norman Bates", cohort: :november}
    ]
    
# print header method
def print_header
    puts "The students of the Villan Academy"
    puts "---------------"
end 

# print student names method
def print(students)
    students.each do |student|
        puts "#{student[:name]}, (#{student[:cohort]} cohort) "
    end
end 

# print total number method
def print_footer(students)
    puts "Overall, we have #{students.count} great students"
end

#calling the methods here
print_header
print(students)
print_footer(students)