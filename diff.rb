class Diff

  def diff(first_path, second_path)

  end

  def sync(first_path, second_path)
    i = 1
    File.open(first_path, 'r') do |f1|
      f1.each_line do |line|
        File.open(second_path, 'r') do |f2|
          f2.each_line do |line2|
            return i if line == line2
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

  def self.test
    "Hello World"
  end
end

