arr = [3,5,1,2,7,9,8,13,25,32]
sum = 0
for i in arr
    sum += i
end
puts sum
puts arr.select {|i| i > 10}


a = ["John", "KB", "Oliver", "Cory", "Matthew", "Christopher"]
puts a.shuffle
puts a.select {|i| i.length > 5}

b = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
puts b.shuffle.last
puts b.shuffle.first
letter = b.shuffle.first
puts "The vowel letter is: " + letter if letter == "a" or letter == "e" or letter == "i" or letter == "o" or letter == "u"

c = Array.new
for i in (1..10)
    i = rand(55..100)
    c.concat([i])
end
puts c

d = Array.new
for i in (1..10)
    i = rand(55..100)
    d.concat([i])
end
puts d.sort
puts d.min
puts d.max

e = ""
for i in (1..5)
    i = (65+rand(26)).chr
    e << i
end
puts e

g = Array.new
for f in (1..10)
    f = ""
    for i in (1..5)
        i = (65+rand(26)).chr
        f << i
    end
    g.concat([f])
end
puts g
