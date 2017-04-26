#!/usr/bin/ruby

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
    puts "Please, enter the name of the students, and cohort." 
    puts "To finish, hit <return> twice"
   
    # create an empty array
    students = []
    cohorts = ['january', 'february', 'march', 'april', 'may', 'june', 'july',
    'august', 'september', 'october', 'november', 'december']
    # get the first name
    puts "Please, enter the name of a student:"
    name = gets.chomp
    # while name not empty repeat this code
    while !name.empty? do
        
        ##add inner loop for cohort entry
        puts "Please, enter the cohort:"
        cohort = gets.chomp.downcase
        #p cohort, cohorts
        # add the student hash to the array
        if cohorts.include? cohort
            cohort = cohort.to_sym
            #p students
        else
            cohort = :none
            #p students
        end
        
        ##add country entry
        puts "Please, enter the country of birth:"
        country_birth = gets.chomp.capitalize

        # add the student hash to the array
        students << {name: name, cohort: cohort, country: country_birth}
        #p students.count
        
        puts "Now we have #{students.count} students"
        #puts students.count == 1 ? " student" : " students"
        
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
    i = 0
    align_size = 20
    while i < students.length
        stud = (students[i][:name]).center(align_size)
        puts "#{i + 1}. #{stud} (#{students[i][:cohort]} cohort), from #{students[i][:country]} "
        i += 1
    end
end 

# print student names grouped by cohort method
def print_by_cohort(students)
    
end 

# print only students that have name starting with specific letter
def print_with_letter(students, letter)
    i = 1
    puts "Student names starting with letter - #{letter.to_s}:"
    students.each do |student|
        if student[:name].chars.first == letter
            puts "#{i}. #{student[:name]} (#{student[:cohort]} cohort) "
            i += 1
        end
    end
    puts
end

# print only students that have name less than 12 chars
SIZE = 12
def print_less12(students)
    i = 1
    puts "Student names with 12 chars or less:"
    students.each do |student|
        if student[:name].size <= SIZE
            puts "#{i}. #{student[:name]} (#{student[:cohort]} cohort) "
            i += 1
        end
    end
    puts
end

# print total number method
def print_footer(students)
    puts "Overall, we have #{students.count} great students"
    puts
end

#calling the methods here
students = input_students
p students
print_header
print(students)
print_footer(students)

print_with_letter(students, "A")
print_less12(students)
print_by_cohort(students)