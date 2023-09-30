# frozen_string_literal: true

class StringCalculator
  DELIMITER_REGEX = %r{^//(\[?.+\]?)+\n}.freeze

  def add(input)
    return 0 if input.empty?

    delimiter = extract_delimiter(input)
    formatted_input = format_input(input)
    numbers = formatted_input.split(/#{delimiter}+/)
    validate(numbers)
    numbers.map(&:to_i).select { |number| number <= 1000 }.sum
  end

  def custom_delimiter?(input)
    input.start_with?('//')
  end

  def extract_delimiter(input)
    if custom_delimiter?(input)
      input.match(DELIMITER_REGEX)[1].gsub('][', ']|[')
    else
      '[,\n]'
    end
  end

  def format_input(input)
    if custom_delimiter?(input)
      input.gsub(DELIMITER_REGEX, '')
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
