
# students = [
#    {name: "Dr. Hannibal Lecter", cohort: :november},
#    {name: "Darth Vader",  cohort: :november},
#    {name: "Nurse Ratched", cohort: :november},
#    {name: "Michael Corleone", cohort: :november},
#    {name: "Alex DeLarge", cohort: :november},
#    {name: "The Wicked Witch of the West", cohort: :november},
#    {name: "Terminator", cohort: :november},
#    {name: "Freddy Krueger", cohort: :november},
#    {name: "The Joker", cohort: :november},
#    {name: "Joffrey Baratheon", cohort: :november},
#    {name: "Norman Bates", cohort: :november}
#    ]


def input_students
    puts "Please, enter the name of the students" 
    puts "To finish, hit <return> twice"
   
    # create an empty array
    students = []
    # get the first name
    name = gets.chomp
    # while name not empty repeat this code
    while !name.empty? do
        # add the student hash to the array
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        
        # get another name from the user
        name = gets.chomp
    end
    # return the array of students
    students
end 

# print header method
def print_header
    puts "The students of the Villan Academy"
    puts "---------------"
end 

# print student names method
def print(students)
    students.each_with_index do |student, index|
        puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort) "
    end
end 

# print total number method
def print_footer(students)
    puts "Overall, we have #{students.count} great students"
end

#calling the methods here
students = input_students
print_header
print(students)
print_footer(students)