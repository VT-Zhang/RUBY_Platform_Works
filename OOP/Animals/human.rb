require_relative 'mammal'

class Human < Mammal
  # previous code removed for brevity

  def explicitily_speak
    self.speak
  end

  def implicitily_speak
    speak
  end
end

person = Human.new
person.explicitily_speak # => I am a protected method
person.implicitily_speak # =
