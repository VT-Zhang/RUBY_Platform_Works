require_relative 'human'
require_relative 'ninja'
require_relative 'samurai'


class Wizzard < Human
    attr_accessor :strength, :intelligence, :health, :stealth
    def initialize health = 50, intelligence = 100
        super health
        super intelligence
    end

    def heal
        @health += 10
        self
    end

    def fireball person
        person.health -= 20
        self
    end
end
