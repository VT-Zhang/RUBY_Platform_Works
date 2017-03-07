class MathDojo
    attr_accessor :result
    def initialize
        @result = 0
        self
    end

    def add *nums
        for i in nums
            if i.class == Array
                for j in i
                    @result += j
                end
            else
                @result += i
            end
        end
        self
    end

    def subtract *nums
        for i in nums
            if i.class == Array
                for j in i
                    @result -= j
                end
            else
                @result -= i
            end
        end
        self
    end
end
puts challenge1 = MathDojo.new.add(2).add(2, 5).subtract(3, 2).result # => 4
puts challenge2 = MathDojo.new.add(1).add([3, 5, 7, 8], [2, 4.3, 1.25]).subtract([2,3], [1.1, 2.3]).result # => 23.15
