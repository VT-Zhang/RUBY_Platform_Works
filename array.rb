a = ["Jason", "Matt", "Ray", "Max"]
b = [5, 6, 9, 3, 1, 2, 4, 7, 8, 10]

puts a.at(0)
puts b.fetch(2)
b.delete(0)
puts b
puts a.reverse
puts b.length
puts b.sort
puts a.slice(2)
puts b.shuffle
puts a.join("-")
puts a.insert(2, "Mike")
puts b.values_at(0, 1, 2)
puts a.values_at(1,2).join(" and ")
