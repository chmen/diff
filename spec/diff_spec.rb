require 'spec_helper'

describe Diff do
  describe '.get_text' do
    it 'return text form file' do
      expect(Diff.get_text('1.txt')).to eq %w(Some Simple Text File)
    end
  end

  describe '.match' do
    it 'return array with two match indexes' do
      array1 = %w(Some Simple Text File)
      array2 = %w(Another Text File With Additional Lines)
      expect(Diff.match(array1, array2)).to eq [2, 1]
    end
  end

  describe '.combine' do
    it 'return combine array from 2 arrays' do
      array1 = %w(Some Simple Text File)
      array2 = %w(Another Text File With Additional Lines)
      match_indexes = [2, 1]
      array3 = %w(Some Simple|Another Text File With Additional Lines)
      expect(Diff.combine(array1, array2, match_indexes)).to eq array3
    end
  end

  describe '.mark' do
    it 'return array with mark symbols' do
      array1 = %w(Some Simple Text File)
      array2 = %w(Another Text File With Additional Lines)
      result = %w(Some Simple|Another Text File With Additional Lines)
      changes = ['-', '*', ' ', ' ', '+', '+', '+']
      expect(Diff.mark(array1, array2, result)).to eq changes
    end
  end
end
