# frozen_string_literal: true

class StringCalculator
  def add(input)
    numbers = input.split(',')
    result = 0
    numbers.each do |number|
      result += number.to_i
    end
    result
  end
end
