# frozen_string_literal: true

require './app/string_calculator'

RSpec.describe StringCalculator do
  subject { described_class.new }

  describe '#add' do
    it 'returns 0 when input is empty string' do
      expect(subject.add("")).to eq(0)
    end

    it 'returns value of number when input only has 1 number' do
      expect(subject.add("2")).to eq(2)
    end

    it 'returns sum of 2 numbers separated by commas' do
      expect(subject.add("1,2")).to eq(3)
    end

    it 'returns sum of numbers separated by commas' do
      expect(subject.add("1,2,3,4")).to eq(10)
    end

    it 'returns sum of numbers separated by new lines' do
      expect(subject.add("1\n2\n")).to eq(3)
    end

    it 'returns error when input is not a number' do
      expect{ subject.add("a") }.to raise_error('Input must be a number')
    end
  end
end
