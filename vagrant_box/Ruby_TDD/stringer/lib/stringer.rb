require "stringer/version"

module Stringer
  def self.spacify *strings
      str = strings.join(' ')
      str
  end

  def self.minify (string, num)
      if string.length <= num
          string
      else
         result = string[0..num]
         result += "..."
         result
      end
  end

  def self.replacify (string, key, replacement)
      result = string.gsub(key, replacement)
      result
  end

  def self.tokenize string
      result = string.split(" ")
      result
  end

  def self.removify string, key
      result = string.gsub(" " + key, "")
      result
  end
end
