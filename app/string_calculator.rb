# frozen_string_literal: true

class StringCalculator
  def add(input)
    return 0 if input.empty?

    numbers = input.split(/,|\n/).map(&:to_i)
    numbers.sum
  end
end
