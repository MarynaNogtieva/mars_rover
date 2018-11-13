require './src/main_point'
require './src/plateau'
require './src/coordinate'
file_path = './src/input.txt'

puts "input your file path or the program will use default #{file_path}"
user_file_path = gets.chomp

input = user_file_path.empty? || user_file_path.nil? ? file_path : user_file_path

begin
  main_point = MainPoint.new(input, Plateau.new(Coordinate.new(0, 0), Coordinate.new(0, 0)))
  main_point.read_file
  main_point.show_rovers_values
rescue StandardError => e
  puts "Something went wrong: \n#{e}"
end