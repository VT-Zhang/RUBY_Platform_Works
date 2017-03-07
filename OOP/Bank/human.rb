class Human
    attr_accessor :strength, :intelligence, :stealth, :health
    def initialize strength = 3, intelligence = 3, stealth = 3, health = 100
        @strength = strength
        @intelligence = intelligence
        @stealth = stealth
        @health = health
    end

    def attack person
        if person.class.ancestors.include?(Human)
            person.health -= 10
        end
        self
    end
end

class Student < Human
    def finger person
        person.health -= 50
        puts "That feel so good hah?"
        puts person.health
        self
    end
end

Nishant = Human.new
Jason = Student.new
Nishant.attack(Jason)
puts Jason.health
Jason.finger(Nishant)
