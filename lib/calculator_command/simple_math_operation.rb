module SimpleMathOperation
  INPUT_CUSTOM_ERROR = 'Input should be float'.freeze
  ZERO_DIVISION_CUSTOM_ERROR = 'divided by 0'.freeze

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
    raise INPUT_CUSTOM_ERROR unless numbers.all? { |number| number.is_a?(Float) }
  end

  def validate_divisor!(number)
    raise ZeroDivisionError.new(ZERO_DIVISION_CUSTOM_ERROR) if number == 0.0
  end
end