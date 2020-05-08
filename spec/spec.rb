require ../'enumerable.rb'

RSpec.describe Enumerable do
 let(:numbers) {[5, 3, 4, 7]}
 let(:string) {%w[www, hi, try, hey]}
 let (:empty) {[]}
 
describe '#my_each' do
  it 'loops through items of the array' do
   expect(numbers.my_each { |element| element}).to eql(numbers)
 end
 end
end



