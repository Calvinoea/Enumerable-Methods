require './enumerable.rb'

RSpec.describe Enumerable do
 let(:numbers) {[5, 3, 4, 7]}
 let(:string) {%w[www, hi, try, hey]}
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

end







