# frozen_string_literal: true

require './app/string_calculator'

RSpec.describe StringCalculator do
  subject(:calculator) { described_class.new }

  describe '#add' do
    it 'returns 0 when input is empty string' do
      expect(calculator.add('')).to eq(0)
    end

    it 'returns value of number when input only has 1 number' do
      expect(calculator.add('2')).to eq(2)
    end

    it 'returns sum of 2 numbers separated by commas' do
      expect(calculator.add('1,2')).to eq(3)
    end

    it 'returns sum of numbers separated by commas' do
      expect(calculator.add('1,2,3,4')).to eq(10)
    end

    it 'returns sum of numbers separated by new lines' do
      expect(calculator.add("1\n2\n")).to eq(3)
    end

    it 'returns error when input is not a number' do
      expect { calculator.add('a') }.to raise_error('Input must be a number')
    end

    it 'handles custom delimiter' do
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it 'returns error when input is negative number' do
      expect { calculator.add('-1') }.to raise_error('Negative numbers are not allowed')
    end

    it 'ignores number bigger than 1000' do
      expect(calculator.add('1,1001')).to eq(1)
    end

    it 'allow any length of delimiter' do
      expect(calculator.add("//[***]\n1***2***3")).to eq(6)
    end
  end
end
