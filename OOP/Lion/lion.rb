require_relative "mammal"

class Lion < Mammal
    attr_reader :health
    def initialize health=170
        super health
    end

    def fly
        @health -= 10
        self
    end

    def attack
        @health -= 50
        self
    end

    def eat
        @health += 20
        self
    end

    def show_health
        puts "This is a lion."
        self.display_health
    end

end
roar = Lion.new
roar.display_health
roar.attack.attack.attack.eat.eat.fly.fly.show_health
