module SimpleMathOperation
  def add(first_number, second_number)
    raise 'Input should be float' unless first_number.is_a?(Float) || second_number.is_a?(Float)

    first_number + second_number
  end
end