Dir[File.dirname(__FILE__) + '/lib/**/*.rb'].each {|file| require file }

puts <<-TEXT
This is a ruby calculator, at first it will zero.
The format is like this: <command><space><number> (some command doesn't need number)
Please type in these commands:
1. add<space><number> (Any number, integer or decimal)
2. subtract<space><number> (Any number, integer or decimal)
3. multiply<space><number> (Any number, integer or decimal)
4. divide<space><number> (Any number, integer or decimal)
5. abs (make the result number absolute)
6. neg (negate the result number)
7. sqrt (square root the result number)
8. sqr (raise the result number to the power of 2)
9. cubert (cube root the result number)
10. cube (raise the result number to the power of 3)
11. repeat<space><step> (repeat operation from n-step before)
12. cancel (reset the calculator to 0.0)
13. exit (exit the program)
TEXT

calculator = RubyCalculator.new
while (input_string = gets.chomp) != 'exit'
  puts calculator.command(input_string)
end
