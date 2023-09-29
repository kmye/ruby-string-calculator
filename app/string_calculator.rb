# frozen_string_literal: true

class StringCalculator
  def add(input)
    num1, num2 = input.split(',')
    num1.to_i + num2.to_i
  end
end
