class CalculatorCommand
  include SimpleMathOperation

  def command(operation, inputs)
    @result = send(operation, *inputs)
  end
end