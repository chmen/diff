require 'spec_helper'

describe Diff do

   # describe '.sync' do
   #   it 'return number of line, that common for both files' do
   #     array1 = ['Some', 'Simple', 'Text', 'File']
   #     array2 = ['Text', 'Text', 'Text', 'Text']
   #     expect(Diff.sync(array1, array2)).to eq 2
   #   end
   # end

  describe '.get_text' do
    it 'return text form file' do
      expect(Diff.get_text('1.txt')).to eq ['Some', 'Simple', 'Text', 'File']
    end
  end

  describe '.match' do 
    it 'return array with two match indexes' do
      array1 = ['Some', 'Simple', 'Text', 'File']
      array2 = ['Another', 'Text', 'File', 'With', 'Additional', 'Lines']
      expect(Diff.match(array1, array2)).to eq [2, 1]
    end
  end

  describe '.combine' do
    it 'return combine array from 2 arrays' do
      array1 = ['Some', 'Simple', 'Text', 'File']
      array2 = ['Another', 'Text', 'File', 'With', 'Additional', 'Lines']
      match_indexes = [2, 1]
      array3 = ['Some', 'Simple|Another', 'Text', 'File', 'With', 'Additional', 'Lines']
      expect(Diff.combine(array1, array2, match_indexes)).to eq array3
    end
  end

  describe '.mark' do
  end
end
