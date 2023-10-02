class RubyCalculator < CalculatorCommand
  attr_accessor :result, :history

  def initialize
    @result = 0.0
    @history = []
  end

  def command(command_string)
    @history << command_string
    inputs = command_string.split(' ')
    operation = inputs.shift
    convert_to_float!(inputs).unshift(@result)

    super operation, inputs
  end

  def convert_to_float!(strings)
    return [] if strings.empty?
    strings.map!(&:to_f)
  end
end
