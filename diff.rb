class Diff

  def diff(first_path, second_path)

  end

  def self.sync(array1, array2)
    array1.each do |a1|
      array2.each do |a2|
        #return array1.index(a1) if a1 == a2 && Diff.second_match(array1.index(array1, array2, a1, a2)
      end
    end
  end

  def self.match(array1, array2)
    array1.each do |a1|
      array2.each do |a2|
        return [array1.index(a1), array2.index(a2)] if a1 == a2
      end
    end
  end

  def numerate

  end

  def mark(array1, result)
    
  end

  def self.combine(array1, array2, match_indexes)
    result = array1
    m1 = match_indexes[0]
    m2 = match_indexes[1]

    (m2..(array2.size - 1)).each do |i|
      if result[m1] == nil
        result.push(array2[i])
      elsif array2[i] != result[m1]
      	result[m1] += "|#{array2[i]}"
      end
      m1 += 1
    end
    
    m1 = match_indexes[0]
    (0..m2).each do |i|
      
      if result[m1] == nil
        result.push(array2[m2 - i])
      elsif array2[m2-i] != result[m1]
        result[m1] += "|#{array2[m2 - i]}"
      end
      m1 -= 1
    end
    result
  end

  def self.get_text(text_path)
    text = []
    File.open(text_path, 'r') do |f|
      f.each_line {|line| text.push(line.gsub("\n", ''))}
    end
    text
  end
end
