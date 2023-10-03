module ComplexMathOperation
  def sqrt(number)
    validate_complex_math_input!(number)
    Math.sqrt(number)
  end

  def sqr(number)
    validate_complex_math_input!(number)
    number * number
  end

  def cubert(number)
    validate_complex_math_input!(number)
    Math.cbrt(number)
  end

  def cube(number)
    validate_complex_math_input!(number)
    number * number * number
  end

  private

  def validate_complex_math_input!(number)
    raise 'Input should be float' unless number.is_a?(Float)
  end
end