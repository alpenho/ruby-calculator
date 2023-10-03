module SimpleMathOperation
  def add(first_number, second_number)
    validate_simple_math_input!(first_number, second_number)
    first_number + second_number
  end

  def subtract(first_number, second_number)
    validate_simple_math_input!(first_number, second_number)
    first_number - second_number
  end

  def multiply(first_number, second_number)
    validate_simple_math_input!(first_number, second_number)
    first_number * second_number
  end

  def divide(first_number, second_number)
    validate_simple_math_input!(first_number, second_number)
    validate_divisor!(second_number)
    first_number / second_number
  end

  def abs(first_number)
    validate_simple_math_input!(first_number)
    first_number.abs
  end

  def neg(first_number)
    validate_simple_math_input!(first_number)
    first_number * -1.0
  end

  private

  def validate_simple_math_input!(*numbers)
    raise 'Input should be float' unless numbers.all? { |number| number.is_a?(Float) }
  end

  def validate_divisor!(number)
    raise ZeroDivisionError.new('divided by 0') if number == 0.0
  end
end