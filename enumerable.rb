# rubocop:disable Style/CaseEquality
module Enumerable
  def my_each
    return to_enum :my_each unless block_given?

    i = 0

    while i < size
      yield self[i]
      i += 1
    end
  end

  def my_each_with_index
    return to_enum :my_each unless block_given?

    i = 0
    while i < size
      yield(self[i], i)
      i += 1
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    selected = []

    my_each { |element| selected.push(element) if yield(element) }
    selected
  end

  def my_all?(*args)
    result = true
    if !args[0].nil?
      my_each { |element| result = false unless args[0] === element }
    elsif !block_given?
      my_each { |element| result = false unless element }
    else
      my_each { |element| result = false unless yield(element) }
    end
    result
  end

  def my_any?(*arg)
    result = false
    if !arg[0].nil?
      my_each { |element| result = true if arg[0] === element }
    elsif !block_given?
      my_each { |element| result = true if element }
    else
      my_each { |element| result = true if yield(element) }
    end
    result
  end

  def my_none?(arg = nil, &block)
    !my_any?(arg, &block)
  end

  def my_count(number = nil)
    counter = 0

    if block_given?
      my_each { |element| counter += 1 if yield(element) }
    elsif number
      my_each { |element| counter += 1 if element == number }
    else
      counter = size
    end
    counter
  end

  def my_map(proc_var = nil)
    return to_enum(:my_map) unless block_given?

    out = []

    if proc_var.nil?
      my_each { |item| out << yield(item) }
    else
      my_each { |item| out << proc_var.call(item) }
    end
    out
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def my_inject(*args)
    arr = is_a?(Range) ? to_a : self

    result = args[0] if args[0].is_a?(Integer)
    sym = args[0].is_a?(Symbol) ? args[0] : args[1]

    if sym
      arr.my_each { |item| result = result ? result.send(sym, item) : item }
      return result
    end
    arr.my_each { |item| result = result ? yield(result, item) : item }
    result
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end

def multiply_els(array)
  array.my_inject { |item, next_item| item * next_item }
end
# rubocop:enable Style/CaseEquality
