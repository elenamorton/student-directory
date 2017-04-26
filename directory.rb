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

def interactive_menu
    students = []
    loop do
        #1. print the menu and show the user what to do
        puts "1. Input the students. "
        puts "2. Show the students"
        puts "9. Exit"
        
        #2. read the selection and save it into a variable
        selection = gets.chomp
       
        #3. do what the user has asked.
        case selection
        when "1"
            # input the students
            input_students(students)
            p students
        when "2"
            # show the students
            print_header
            print_all(students)
            print_footer(students)
            
        when "9"
            exit # this will cause the program to terminate
        else
            puts "I don't know what thsi means, try again"
        end
        
    end
end

# populate the students list
def input_students(students)
    puts "Please, enter the name of the students, and cohort." 
    puts "To finish, hit <return> twice"
   
    # create an empty array

    cohorts = ['january', 'february', 'march', 'april', 'may', 'june', 'july',
    'august', 'september', 'october', 'november', 'december']
    
    # get the first name
    puts "Please, enter the name of a student:"
    name = gets.gsub("\n", '')
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
        
        print "Now we have #{students.count} "
        puts students.count == 1 ? "student" : "students"
        
        # get another name from the user
        puts "Please, enter the name of a student:"
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
def print_all(students)
    i = 0
    align_size = 20
    while i < students.length
        stud = (students[i][:name]).center(align_size)
        puts "#{i + 1}. #{stud} (#{students[i][:cohort]} cohort), from #{students[i][:country]} "
        i += 1
    end
end 

# print student names grouped by cohort 
def print_by_cohort(students, cohort)
    return if students.count == 0
    names = []
    students.select do |student| 
        if student[:cohort] == cohort
                names.push student[:name]
        end
    end  
    #p names
    puts "The students in #{cohort.capitalize} cohort are as follows: "
    names.each_index { |i| puts "#{i+1}. #{names[i]}" }
end 

# print only students that have name starting with specific letter
def print_with_letter(students, letter)
    return if students.count == 0
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
    return if students.count == 0
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
interactive_menu

#students = input_students
#print_header
#print_all(students)
#print_footer(students)

print_with_letter(students, "A")
print_less12(students)
print_by_cohort(students, :may)