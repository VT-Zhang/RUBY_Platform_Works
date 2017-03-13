class Human
    attr_accessor :strength, :intelligence, :stealth, :health
    def initialize
        @strength = 3
        @intelligence = 3
        @stealth = 3
        @health = 100
    end
    def attack(obj)
        if obj.class.ancestors.include?(Human)
            obj.health -= 10
            true
        else
            false
        end
    end
end

RSpec.describe Human do
  it 'has a getter and setter attribute for strength' do
      human = Human.new
      expect{human.strength = 5}.to_not raise_error
      expect(human.strength).to eql(5)
  end
  it 'has a getter and setter attribute for intelligence' do
      human = Human.new
      expect{human.intelligence = 5}.to_not raise_error
      expect(human.intelligence).to eql(5)
  end
  it 'has a getter and setter attribute for stealth' do
      human = Human.new
      expect{human.stealth = 5}.to_not raise_error
      expect(human.stealth).to eql(5)
  end
  it 'has a getter and setter attribute for health' do
      human = Human.new
      expect{human.health = 5}.to_not raise_error
      expect(human.health).to eql(5)
  end
  it 'has a default value for health, strength, intelligence and stealth' do
      human = Human.new
      expect(human.health).to eql(100)
      expect(human.strength).to eql(3)
      expect(human.intelligence).to eql(3)
      expect(human.stealth).to eql(3)
  end
  it 'has a method called attack' do
      human = Human.new
      expect{human.attack}.to_not raise_error(NoMethodError)
  end
  it 'attacks only when a human is passed as an argument' do
      human = Human.new
      human2 = Human.new
      expect{human.attack}.to raise_error(ArgumentError)
      expect{human.attack(human2)}.to_not raise_error
  end
  it 'decreases health if attacked' do
      human = Human.new
      human2 = Human.new
      old_health = human2.health
      human.attack(human2)
      expect(human2.health).to be < old_health
  end
end
