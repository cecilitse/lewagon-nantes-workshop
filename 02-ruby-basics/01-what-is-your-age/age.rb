puts "What is your name?"
name = gets.chomp # asks user to type something in the Terminal

puts "Ok got it!"

# TODO: your code goes here

puts "What is your year of birth?"
year_of_birth = gets.chomp

puts "Thanks!"

age = 2019 - year_of_birth.to_i

puts "Hey #{name}! You are #{age} years old this year. But you seem younger."
