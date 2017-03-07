require_relative 'human'

class Samurai < Human
    attr_accessor :strength, :intelligence, :health, :stealth
    @@counter = 0
    def initialize health = 200
        super health
        @@counter += 1
    end

    def death_blow person
        person.health = 0
    end

    def meditate
        @health = 200
    end

    def how_many
        puts "There are altogether @@counter samurai(s)."
    end

end
