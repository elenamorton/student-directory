
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
# firstly, we print the name of the students
puts "The students of the Villan Academy"
puts "---------------"

students.each do |student|
    puts student
end

# finally, we print the total number of students
puts "Overall, we have #{students.count} great students"
