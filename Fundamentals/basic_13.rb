# 1 Print 1-255
def print_1_255
    puts (1..255).collect {|i| i}
end
print_1_255

#2 Print odd numbers between 1-255
def odd_num
    puts (1..255).select {|i| i%2 == 1}
end
odd_num

#3 Print Sum
def print_sum
    sum = 0
    for i in (1..255)
        sum += i
        puts "New number: " + i.to_s + " Sum: " + sum.to_s
    end
end
print_sum

# 4 Iterating through an array
def iterating_array x
    puts x.collect {|i| i}
end
iterating_array([1,3,5,7,9,13])

#5 Find Max
def find_max arr
    max = arr[0]
    for i in arr
        if i > max
            max = i
        end
    end
    puts max
    return max
end
find_max ([3, 5, 7])

#6 Get Average
def get_average arr
    sum = 0.0
    for i in arr
        sum += i
    end
    average = sum/arr.length
    puts sum
    puts average.to_f
    return average.to_f
end
get_average([1,2,3,4,5,6])

#7 Array with Odd Numbers
def odd_array
    arr = Array.new
    for i in (1..255)
        if i % 2 == 1
            arr.concat([i])
        end
    end
    puts arr
    return arr
end
odd_array

# 8 Greater Than Y
def greater_than_y(x, y)
    counter = 0
    for i in x
        if i > y
            counter +=1
        end
    end
    puts counter
    return counter
end
greater_than_y([1, 3, 5, 7], 3)

#9 Square the values
def square_the_value(x)
    x.collect! {|i| i*i}
    puts x
    return x
end
square_the_value([1, 5, 10, -2])

# 10 Eliminate Negative Numbers
def no_negs x
    for i in (0...x.length)
        if x[i] < 0
            x[i] = 0
        end
    end
    puts x
    return x
end
no_negs([1, 5, 10, -2])

#11 Max, Min, and Average
def x_m_a x
    max = x[0]
    min = x[0]
    sum = 0.0
    for i in x
        sum += i
        if i > max
            max = i
        end
        if i < min
            min = i
        end
    end
    avg = sum/x.length
    arr = Array.new
    arr.concat([max, min, avg])
    puts arr
    return arr
end
x_m_a([1, 5, 10, -2])

#12 Shifting the Values in the Array
def shift x
    for i in (0...x.length)
        x[i] = x[i+1]
    end
    x.pop
    x.concat([0])
    puts x
    return x
end
shift([1, 5, 10, 7, -2])

#13 Number to String
def n_t_s x
    for i in (0...x.length)
        if x[i] < 0
            x[i] = "Dojo"
        end
    end
    puts x
    return x
end
n_t_s([-1, -3, 2])
