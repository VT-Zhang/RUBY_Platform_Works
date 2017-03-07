require_relative 'mammal'

class Dog < Mammal
    def show_health
        self.display_health
        self
    end

    def pet
        @health += 5
        self
    end

    def walk
        @health -= 1
        self
    end

    def run
        @health -= 10
        self
    end
end

woffy = Dog.new
woffy.show_health
woffy.walk.walk.walk.run.run.pet.show_health
