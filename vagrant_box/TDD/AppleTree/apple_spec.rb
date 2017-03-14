require_relative 'apple'
RSpec.describe Apple do
    before (:each) do
        @apple = Apple.new
    end

    it 'has a getter and setter attribute for age' do
        expect{@apple.age = 5}.to_not raise_error
        expect(@apple.age).to eql(5)
    end

    it 'raise an error if attempts to set the height' do
        expect{@apple.height = 1}.to raise_error(NoMethodError)
    end

    it 'raise an error if attempts to set the count' do
        expect{@apple.count = 1}.to raise_error(NoMethodError)
    end

    it 'has a method called yearGoneby' do
        expect{@apple.yearGoneby}.to_not raise_error(NoMethodError)
    end

    it 'the yearGoneby method should add age by 1' do
        @apple2 = Apple.new
        @old_age = @apple2.age
        @apple.yearGoneby
        expect(@apple.age - @old_age).to eq(1)
    end

    it 'the yearGoneby method should add height by 10%' do
        @apple2 = Apple.new
        @old_height = @apple2.height
        @apple.yearGoneby
        expect(@apple.height / @old_height).to eq(1.1)
    end

    it 'the yearGoneby method should add count by 2' do
        @apple2 = Apple.new
        @old_count = @apple2.count
        @apple.age = 3
        @apple.yearGoneby
        expect(@apple.count - @old_count).to eq(2)
    end

    it 'has a method called pick_apples' do
        expect{@apple.pick_apples}.to_not raise_error(NoMethodError)
    end


    it 'the pick_apples method should reduce the apple count to zero' do
        @apple.pick_apples
        @apple.count.should be 0
    end

    it 'should not grow apple for the first three years of its life' do
        @apple.yearGoneby
        @apple.count.should_not be > 0
    end

    it 'should not grow apples if the tree is older than 10' do
        @apple.age = 11
        @apple.yearGoneby
        @apple.count.should be 0
    end

end
