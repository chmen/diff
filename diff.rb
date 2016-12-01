class Diff
  def self.sync(path1, path2)
    text1 = get_text(path1)
    text2 = get_text(path2)

    match_indexes = match(text1, text2)

    result = combine(text1, text2, match_indexes)

    difference = mark(text1, text2, result)

    result.each_with_index do |line, index|
      puts "#{index + 1} #{difference[index]} #{line}"
    end
  end

  def self.match(array1, array2)
    array1.each do |a1|
      array2.each do |a2|
        return [array1.index(a1), array2.index(a2)] if a1 == a2
      end
    end
  end

  def self.mark(array1, array2, result)
    difference = []
    result.each do |line|
      if array1.include?(line) && array2.include?(line)
        difference.push(' ')
      elsif array1.include?(line) && !array2.include?(line)
        difference.push('-')
      elsif !array1.include?(line) && array2.include?(line)
        difference.push('+')
      elsif line.include?('|')
        difference.push('*')
      end
    end
    difference
  end

  def self.combine(array1, array2, match_indexes)
    result = Array.new(array1)
    m1 = match_indexes[0]
    m2 = match_indexes[1]

    (m2..(array2.size - 1)).each do |i|
      if result[m1].nil?
        result.push(array2[i])
      elsif array2[i] != result[m1]
        result[m1] += "|#{array2[i]}"
      end
      m1 += 1
    end

    m1 = match_indexes[0]
    (0..m2).each do |i|
      if result[m1].nil?
        result.push(array2[m2 - i])
      elsif array2[m2 - i] != result[m1]
        result[m1] += "|#{array2[m2 - i]}"
      end
      m1 -= 1
    end
    result
  end

  def self.get_text(text_path)
    text = []
    File.open(text_path, 'r') do |f|
      f.each_line { |line| text.push(line.delete("\n")) }
    end
    text
  end
end

Diff.sync('1.txt', '2.txt')
