class Mammal
  def breath
    puts "Inhale and exhale"
  end

  def eat
    puts "Yum yum yum"
  end
end

class Human < Mammal # Human inherits from Mammal
  def subclass_method
    self.breath
  end

  def another_method
    self.eat
  end
end

person = Human.new
person.subclass_method
person.another_method
