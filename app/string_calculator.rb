# frozen_string_literal: true

class StringCalculator
  def add(input)
    return 0 if input.empty?
    delimiter = extract_delimiter(input)
    formatted_input = format_input(input)
    numbers = formatted_input.split(/#{delimiter}/)
    validate(numbers)
    numbers.map(&:to_i).sum
  end

  def has_custom_delimiter?(input)
    input.start_with?("//")
  end

  def extract_delimiter(input)
    if has_custom_delimiter?(input)
      "[#{input.match(/^\/\/(.)\n/)[1]}]"
    else
      '[,\n]'
    end
  end

  def format_input(input)
    if has_custom_delimiter?(input)
      input.gsub(/^\/\/.\n/, '')
    else
      input
    end
  end

  def validate(numbers)
    numbers.each do |number|
      raise 'Negative numbers are not allowed' if number.to_i.negative?
      raise 'Input must be a number' unless number.match?(/^\d+$/)
    end
  end
end
