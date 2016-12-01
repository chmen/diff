require 'spec_helper'

describe Diff do
  describe '.test' do
    it 'return hello world' do
      expect(Diff.test).to eq "Hello World"
    end
  end

  # describe '.sync' do
  #   it 'return number of line, that common for both files' do
  #     expect(Diff.sync('1.txt', '2.txt')).to eq 2
  #   end
  # end

  describe '.get_text' do
    it 'return text form file' do
      expect(Diff.get_text('1.txt')).to eq "Some
Simple
Text 
File"
    end
  end

end
