#spec/spec.rb
require_relative '../enumerable.rb'


RSpec.describe Enumerable do
 let(:numbers) {[5, 3, 4, 7]}
 let(:string) {%w[www, hi, try, hey]}
 let(:nil_array) {[nil, true, 54]}
 let (:empty) {[]}

describe '#my_each' do
  it 'loops through items of the array' do
   expect(numbers.my_each { |element| element}).to eql(numbers)
 end
end

 it 'loops through array of strings' do
    expect(string.my_each {|element| element}).to eql(string)
end

it 'retuns enumerator if a block is not given' do
  expect(numbers.my_each).to be_a(Enumerator)
 end
end

describe '.my_each_with_index' do
 it 'returns items with their index' do
   selected = []
   numbers.my_each_with_index {|n, i| result << "#{n}: #{i}"}
   expect(result).to eql(['1:0', '2:1', '3:2', '4:3'])
end
 it 'returns Enumerator when block is not passed' do
    expect(numbers.my_each_with_index).to be_a(Enumerator)
 end
end

describe '.my_select' do
  it 'returns items when true is returned to block'
    expect(numbers.my_select).to be_a(Enumerator)
end

it 'filter array' do
  expect(numbers.my_select(&:even?)).to eql([0])
  end
end

describe '.my_all' do
  it 'still scans the array if there is no block' do
    expect(nil_array.my_all?).to be(false)
  end

  it 'Works with empty arrays' do
    expect(empty.my_all?).to be(true)
  end
end

describe '#my_any' do
  it 'scans the array even if there is no block'
  expect(nil_array.my_any?).to be(true)
end

it 'works even if array is empty' do
  expect(empty.my_any?).to be(false)
  end
end

describe 'my_none' do
  it 'Goes through array even if no block is given' do
    expect(nil_array.my_none?).to be(false)
  end

  it 'works even if array is empty' do
    expect(empty.my_none?).to be(true)
  end
end

describe '.my_inject' do
  it 'returns the result of the operation on elements' do
    expect((5..10).my_inject(:*)).to eql((5..10)).inject(:*))
  end
end

it 'returns result of operations with first value' do
  output = (5..10).inject(2, :*)
  expect((5..10)).my_inject(2, :*)).to eql(output)
  end
end

it 'returns the result of all operations on elements' do
  output = numbers.inject {|item,next_item| item * next_item}
  expect(numbers.my_inject {|item, next_item|}).to eql(output)
 end
end

it 'returns accumulation of operations on all items, with first value' do
  output = numbers.inject(2) {|item, next_item|}).to eql(output)
  expect(numbers.my_inject(2) {|item, next_item|}).to eql(output)
  end
end

describe 'multiply_els' do
  it 'tests my_inject'
    expect(multiply_els([2,4,5])).to be(40)
   end
  end
 end
end












