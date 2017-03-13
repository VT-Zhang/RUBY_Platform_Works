require_relative 'human'
RSpec.describe Human do
    before(:each) do
        @human1 = Human.new
    end
    it 'has attribute strength' do
        expect(@human1.strength).should be_true
    end
end
