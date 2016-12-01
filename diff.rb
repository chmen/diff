class Diff

  def diff(first_path, second_path)

  end

  def self.sync(text1, text2)

  end

  def numerate

  end

  def mark

  end

  def self.get_text(text_path)
    text = []
    File.open(text_path, 'r') do |f|
      f.each_line {|line| text.push(line.gsub("\n", ''))}
    end
    text
  end
end

