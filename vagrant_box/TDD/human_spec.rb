require_relative 'human'
RSpec.describe Human do
    before(:each) do
        @human1 = Human.new
    end
    context 'has strength, stealth, intelligence, health attributes' do
        it 'does not has strength attribute' do
            expect(@human1).should_not be nil
        end
        it 'does notmhas stealth attribute' do
            expect(@human1.stealth).should_not be nil
        end
        it 'does not has intelligence attribute' do
            expect(@human1.intelligence).should_not be nil
        end
        it 'does not has health attribute' do
            expect(@human1.health).should_not be nil
        end
    end


    context 'has proper default values' do
        it 'doe not has strength equals 3' do
            expect(@human1.strength).to eq(3)
        end
        it 'doe not has stealth equals 3' do
            expect(@human1.stealth).to eq(3)
        end
        it 'doe not has intelligence equals 3' do
            expect(@human1.intelligence).to eq(3)
        end
        it 'doe not has health equals 100' do
            expect(@human1.health).to eq(100)
        end
    end

    
end
