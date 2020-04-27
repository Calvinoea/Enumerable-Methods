module Enumerable
  def my_each
    return to_enum :my_each unless block_given?
    i = 0

    while i < self.size
      yield self[i]
      i+=1
    end
  end

  def my_each_with_index
    return to_enum :my_each unless block_given?

    i = 0
    while i < self.size
      yield(self[i],i)
      i += 1
    end
  end


end


array = [5,4,6,7]


puts array.my_each {|h| puts "#{h} is the guy"}
puts array.my_each_with_index{|h| puts "#{h} is the index"}