# frozen_string_literal: true

class StringCalculator
  def add(input)
    return 0 if input.empty?
    custom_delimiter = input.match(/^\/\/(.)\n/)
    formatted_input = if custom_delimiter.nil?
                        input
                      else
                        input.gsub(/^\/\/.\n/, '')
                      end

    regex = if custom_delimiter.nil?
              /,|\n|/
            else
              custom_delimiter[1]
            end


    numbers = formatted_input.split(regex)

    result = 0
    numbers.each do |number|
      raise 'Input must be a number' unless number.match?(/^\d+$/)

      result += number.to_i
    end

    result
  end
end
