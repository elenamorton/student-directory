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

@students = [] #global variable accesible to all methods

def print_menu
    puts "1. Input the students. "
    puts "2. Show the students"
    puts "3. Save the list to students.cvs"
    puts "4. Load the list from students.cvs"
    puts "9. Exit" # 9 because we'll be adding more items 
end 

def show_students
    print_header
    print_students_list
    print_footer
end 

# save the students list to students.cvs
def save_students
    return if @students.count == 0
    # open the file for writing
    file = File.open("students.cvs", "w")
    
    # iterate over the array of students
    @students.each do |student|
       cvs_line = [student[:name], student[:cohort]].join(",")
       file.puts cvs_line 
    end
    file.close
end 

# load the students from the students.cvs file
def load_students
    # open the file for reading
    file = File.open("students.cvs", "r")
    return if !file
    file.readlines.each do |line|
        name, cohort = line.chomp.split(",")
        @students << {name: name, cohort: cohort.to_sym}
    end
    file.close
end

# method to select the menu option
def process(selection)
    case selection
    when "1"
        # input the students
        input_students
        p @students
    when "2"
        # show the students
        show_students
    when "3"
        # save the students to a cvs file
        save_students
    when "4"
        # load teh students from a cvs file
        load_students
    when "9"
        exit # this will cause the program to terminate
    else
        puts "I don't know what thsi means, try again"
    end
end 


def interactive_menu
    loop do
        print_menu
        process(gets.chomp)
    end
end

# populate the students list
def input_students
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
            #p @students
        else
            cohort = :none
            #p @students
        end
        
        ##add country entry
        puts "Please, enter the country of birth:"
        country_birth = gets.chomp.capitalize

        # add the student hash to the array
        @students << {name: name, cohort: cohort, country: country_birth}
        #p students.count
        
        print "Now we have #{@students.count} "
        puts @students.count == 1 ? "student" : "students"
        
        # get another name from the user
        puts "Please, enter the name of a student:"
        name = gets.chomp
    end
    # return the array of students
    @students
end 

# print header method
def print_header
    puts "The students of the Villan Academy"
    puts "---------------"
end 

# print student names method
def print_students_list
    return if @students.count == 0
    i = 0
    align_size = 20
    while i < @students.length
        stud = (@students[i][:name]).center(align_size)
        puts "#{i + 1}. #{stud} (#{@students[i][:cohort]} cohort), from #{@students[i][:country]} "
        i += 1
    end
end 

# print student names grouped by cohort 
def print_by_cohort(cohort)
    return if @students.count == 0
    names = []
    @students.select do |student| 
        if student[:cohort] == cohort
                names.push student[:name]
        end
    end  
    #p names
    puts "The students in #{cohort.capitalize} cohort are as follows: "
    names.each_index { |i| puts "#{i+1}. #{names[i]}" }
end 

# print only students that have name starting with specific letter
def print_with_letter(letter)
    return if @students.count == 0
    i = 1
    puts "Student names starting with letter - #{letter.to_s}:"
    @students.each do |student|
        if student[:name].chars.first == letter
            puts "#{i}. #{student[:name]} (#{student[:cohort]} cohort) "
            i += 1
        end
    end
    puts
end

# print only students that have name less than 12 chars
SIZE = 12
def print_less12
    return if @students.count == 0
    i = 1
    puts "Student names with 12 chars or less:"
    @students.each do |student|
        if student[:name].size <= SIZE
            puts "#{i}. #{student[:name]} (#{student[:cohort]} cohort) "
            i += 1
        end
    end
    puts
end

# print total number method
def print_footer
    puts "Overall, we have #{@students.count} great students"
    puts
end

#calling the methods here
interactive_menu

#students = input_students
#print_header
#print_students_list
#print_footer

print_with_letter("A")
print_less12
print_by_cohort(:may)