# frozen_string_literal: true

class StringCalculator
  def add(input)
    return 0 if input.empty?

    numbers = input.split(/,|\n/)
    result = 0
    numbers.each do |number|
      raise 'Input must be a number' unless number.match?(/^\d+$/)

      result += number.to_i
    end

    result
  end
end
