require_relative 'human'

class Ninja < Human
    attr_accessor :strength, :intelligence, :health, :stealth
    def initialize stealth = 175
        super stealth 
    end

    def steal person
        person.health -= 10
        @health += 10
        self
    end

    def get_away
        @health -= 15
        self
    end

end
