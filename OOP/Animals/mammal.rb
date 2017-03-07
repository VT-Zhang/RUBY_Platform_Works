class Mammal
  # previous code removed for brevity

  def calling_speak
    speak
  end

  protected
    def speak
      puts "I am a protected method"
    end
end
