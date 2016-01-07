

class Array
  def flatten2
    temp = []
    self.each do |i|
      if i.kind_of?(Array)
        temp += i.flatten2
      else
        temp << i
      end
    end
    temp
  end
end

test = [1, 2, [3, [4], 5], [6], 7]

puts test.flatten2.to_s