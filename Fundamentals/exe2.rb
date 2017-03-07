def method
    puts "You are great!!"
end
method

def say_hello (name1, name2)
    if name1.empty? or name2.empty?
        puts "Who are you?"
        return
    end
    puts "hello, #{name1} and #{name2}"
end
say_hello "", ""
