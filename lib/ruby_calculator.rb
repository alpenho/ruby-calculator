class RubyCalculator < CalculatorCommand
  attr_accessor :result, :history

  def initialize
    @result = 0.0
    @history = []
  end

  def command(command_string, repeat_index: nil)
    # put the command string to history if this command is being run by user, not by repeat
    @history << command_string if repeat_index.nil?
    inputs = command_string.split(' ')
    operation = inputs.shift

    if operation == 'repeat'
      return repeat(inputs.first.to_i, repeat_index)
    end

    convert_to_float!(inputs).unshift(@result)
    super operation, inputs
  end

  def repeat(number, repeat_index)
    repeat_index = @history.length - 1 if repeat_index.nil?
    start_index = repeat_index - number

    @history[start_index..repeat_index - 1].each do |command_string|
      command(command_string, repeat_index: start_index)
      start_index += 1
    end

    @result
  end

  def convert_to_float!(strings)
    return [] if strings.empty?
    strings.map!(&:to_f)
  end
end
