class CalculatorCommand
  include SimpleMathOperation
  include ComplexMathOperation

  def command(operation, inputs)
    @result = send(operation, *inputs)
  end
end