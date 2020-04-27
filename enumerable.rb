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

def my_select
  return to_enum(:my_select) unless block_given?

  selected = []

  my_each{|element| selected.push(element) if yield(element)}
  selected

end


def my_all?(*args)
  result = true
  if !args[0].nil?
    my_each {|element| result = false unless args[0] === element}
  elsif !block_given?
    my_each {|element| result = false unless element}
  else
    my_each {|element| result = false unless yield(element)}
  end
  result
end

def my_any?(*arg)
  result = false
  if !arg[0].nil?
    my_each {|element| result = true if arg[0] === element}
  elsif !block_given?
    my_each {|element| result = true if element}
  else
    my_each {|element| result = true if yield(element)}
  end
  result
end


def my_none?(arg = nil, &block)
  !my_any?(arg, &block)
end

def my_count(number = nil)
  counter = 0

  if block_given?
    my_each {|element| counter += 1 if yield(item)}
  elsif number
    my_each {|element| counter+= 1 if item == number}
  else
    counter = size
  end
  counter
end




end


array = [5,4,6,7,5]


puts array.my_each {|h| puts "#{h} is the guy"}
puts array.my_each_with_index{|h| puts "#{h} is the index"}
puts array.my_select { | num | num.odd? }
puts [100,200].my_all?
puts array.my_any?
puts array.my_none?
puts array.my_count