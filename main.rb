Dir[File.dirname(__FILE__) + '/lib/**/*.rb'].each {|file| require file }

puts <<-TEXT
This is a ruby calculator, at first it will zero.
The format is like this: <command><space><number> (some command doesn't need number)
Please type in these commands:
1. add<space><number> (Any number, integer or decimal)
TEXT

calculator = RubyCalculator.new
while (input_string = gets.chomp) != 'exit'
  puts calculator.command(input_string)
end
