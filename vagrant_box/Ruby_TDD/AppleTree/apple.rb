class Apple
    attr_accessor :age
    attr_reader :height, :apple, :count

    def initialize age=0, height=1, count=0
        @age = age
        @height = height
        @count = count
    end

    def yearGoneby
        @age += 1
        @height *= 1.1
        if @age > 3 && @age < 10
            @count += 2
        end
        self
    end

    def pick_apples
        @count = 0
        self
    end

end
