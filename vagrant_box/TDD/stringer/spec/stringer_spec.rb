require "spec_helper"

RSpec.describe Stringer do
  it "concatenates undefined number of strings with a space" do
      expect(Stringer.spacify "Oscar", "Vazquez", "Zweig", "Olasaba", "Hernandez", "Ricardo", "Mendoza").to eq("Oscar Vazquez Zweig Olasaba Hernandez Ricardo Mendoza")
  end

  it "for minify function should shorten the string with the max length and add '...'" do
      expect(Stringer.minify("Hello, I'm learning how to create a gem", 10)).to eq("Hello, I'm ...")
  end

  it "for minify function should otherwise return the string itself" do
      expect(Stringer.minify("Hello", 10)).to eq("Hello")
  end

  it "for replacify function to replace certain words in the given string." do
      expect(Stringer.replacify("I can't do this.", "can't", "can")).to eq("I can do this.")
  end

  it "for tokenize function put each word in the string to an array." do
      expect(Stringer.tokenize("I love to code")).to eq(["I", "love", "to", "code"])
  end

  it "for removify function to remove given words in the string." do
      expect(Stringer.removify("I'm not a developer.", "not")).to eq("I'm a developer.")
  end
end
