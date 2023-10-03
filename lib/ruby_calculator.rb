class RubyCalculator < CalculatorCommand
  attr_accessor :result, :history

  REPEAT_COMMAND = 'repeat'.freeze
  CANCEL_COMMAND = 'cancel'.freeze
  NO_METHOD_CUSTOM_MESSAGE = 'There is no command like that, please use the available command'.freeze

  def initialize
    @result = 0.0
    @history = []
  end

  def command(command_string, repeat_index: nil)
    inputs = command_string.split(' ')
    operation = inputs.shift
    first_input = @result
    first_input = repeat_index if operation == REPEAT_COMMAND
    repeat_index = 0 if operation == CANCEL_COMMAND # to make operation cancel not saved in history

    begin
      inputs = convert_to_float(inputs).unshift(first_input)
      super operation, inputs

      # put the command string to history if this command is being run by user, not by repeat
      @history << command_string if repeat_index.nil?
      @result
    rescue ArgumentError => error
      error.message
    rescue NoMethodError => error
      NO_METHOD_CUSTOM_MESSAGE
    end
  end

  def repeat(repeat_index, number)
    repeat_index = @history.length if repeat_index.nil?
    start_index = repeat_index - number.to_i

    @history[start_index..repeat_index - 1].each do |command_string|
      command(command_string, repeat_index: start_index)
      start_index += 1
    end

    @result
  end

  def cancel(number)
    0.0
  end

  def convert_to_float(strings)
    return [] if strings.empty?
    strings.map(&:to_f)
  end
end
