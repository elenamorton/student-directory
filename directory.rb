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

def interactive_menu
    loop do
        print_menu
        process(STDIN.gets.chomp)
    end
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
        save_students(enter_file)
        
    when "4"
        # load the students from a cvs file
        load_students(enter_file)
        
    when "9"
        exit # this will cause the program to terminate
        
    else
        puts "I don't know what this means, try again"
    end
end 

def enter_file
    puts "Please, enter a file name. Default file is 'students.cvs'."
    filename = gets.chomp!
    if filename.empty?
        filename = "students.cvs"
    end
    filename
end

# populate the students list from the cmd. line
def input_students
    puts "Please, enter the name of the students, and cohort." 
    puts "To finish, hit <return> twice"

    cohorts = ['january', 'february', 'march', 'april', 'may', 'june', 'july',
    'august', 'september', 'october', 'november', 'december']
    
    # get the first name
    puts "Please, enter the name of a student:"
    name = STDIN.gets.gsub("\n", '')
    # while name not empty repeat this code
    while !name.empty? do
        
        ##add inner loop for cohort entry
        puts "Please, enter the cohort:"
        cohort = STDIN.gets.chomp.downcase
        #p cohort, cohorts
        # add the student hash to the array
        if cohorts.include? cohort
            cohort = cohort.to_sym
        else
            cohort = :none
        end
        ##add country entry
        puts "Please, enter the country of birth:"
        country_birth = STDIN.gets.chomp.capitalize
        # add the student hash to the array
        @students << {name: name, cohort: cohort, country: country_birth}
        #p students.count
        
        print "Now we have #{@students.count} "
        puts @students.count == 1 ? "student" : "students"
        
        # get another name from the user
        puts "Please, enter the name of a student:"
        name = STDIN.gets.chomp
    end
    @students # return the array of students
end 

def show_students
    print_header
    print_students_list
    print_footer
end 

# save the students list to students.cvs
def save_students(filename = "students.cvs")
    return if @students.count == 0
    p filename
    # open the file for writing
    file = File.open(filename, "w")
    
    # iterate over the array of students
    @students.each do |student|
       cvs_line = [student[:name], student[:cohort]].join(",")
       file.puts cvs_line 
    end
    file.close
end 

# load the students from the *.cvs file
def load_students(filename)
    # open the file for reading
    file = File.open(filename, "r")
    return if !file
    file.readlines.each do |line|
        name, cohort = line.chomp.split(",")
        @students << {name: name, cohort: cohort.to_sym}
    end
    puts "Loaded #{@students.count} students from #{filename} file"
    file.close
end

# load the students from a file specified in the command line
def try_load_students(filename = "students.cvs")
    #change to load students from "students.cvs"
    if ARGV.first # first argument from the command line, 'nil' if no argument.
        filename = ARGV.first
    end
    #return if filename.nil? # return if file name not given
    
    if File.exists?(filename) # check if file exists
        load_students(filename)
        #puts "Loaded #{@students.count} students from #{filename} file"
    else
        puts "Sorry, #{filename} does not exist!"
        exit # quit the program
    end
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

# print total number method
def print_footer
    puts "Overall, we have #{@students.count} great students"
    puts
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

#calling the methods here
try_load_students  #("none.cvs") - check for non-existent file
interactive_menu

print_with_letter("A")
print_less12
print_by_cohort(:may)