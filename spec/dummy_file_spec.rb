# frozen_string_literal: true

require './app/dummy_file'

RSpec.describe DummyFile do
  describe '#some_complex_fn' do
    it 'some tests here' do
      expect(described_class.new.some_complex_fn).to eq('Hello World')
    end
  end
end
