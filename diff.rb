class Diff

  def diff(first_path, second_path)

  end

  def self.sync(first_path, second_path)
    i = 1
    File.open(first_path, 'r') do |f1|
      f1.each_line do |line|
      	puts line
        File.open(second_path, 'r') do |f2|
          f2.each_line do |line2|
          	puts line2
            return i if line.eql?(line2)
          end
        end
        i += 1
      end
    end
  end

  def numerate

  end

  def mark

  end

  def self.get_text(text_path)
    text = ''
    File.open(text_path, 'r') do |f|
      f.each_line {|line| text += line}
    end
    text
  end

  def self.test
    "Hello World"
  end
end

