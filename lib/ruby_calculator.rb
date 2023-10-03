class RubyCalculator < CalculatorCommand
  attr_accessor :result, :history

  def initialize
    @result = 0.0
    @history = []
  end

  def command(command_string, repeat_index: nil)
    inputs = command_string.split(' ')
    operation = inputs.shift

    if operation == 'repeat'
      repeat(inputs.first.to_i, repeat_index)
    elsif operation == 'cancel'
      cancel
      repeat_index = 0 # to make operation cancel not saved in history
    else
      inputs = convert_to_float(inputs).unshift(@result)
      super operation, inputs
    end

    # put the command string to history if this command is being run by user, not by repeat
    @history << command_string if repeat_index.nil?
    @result
  end

  def repeat(number, repeat_index)
    repeat_index = @history.length if repeat_index.nil?
    start_index = repeat_index - number

    @history[start_index..repeat_index - 1].each do |command_string|
      command(command_string, repeat_index: start_index)
      start_index += 1
    end

    @result
  end

  def cancel
    @result = 0.0
  end

  def convert_to_float(strings)
    return [] if strings.empty?
    strings.map(&:to_f)
  end
end
