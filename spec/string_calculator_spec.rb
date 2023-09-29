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
  end
end
