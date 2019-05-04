module Enumerable
    #my_each method
    def my_each
       for i in 0...self.size do
           yield(self[i])
       end
       
    end #my_each
    
    #Each with index
    def my_each_with_index
        for i in 0...self.size do
            yield(self[i], i)
        end
    end

    #Select

    def my_select
        returnedArray = []
        self.my_each do |element|
        if block_given?
            if yield(element) == true
                returnedArray.push(element)
            end #if
        end  #block
    end
    returnedArray
    end #method

    def my_all?
        returnedArray = []
        self.my_each do |element|
            if block_given?
                if yield(element) == true
                    returnedArray.push(element)
                end  
            end
        end
        self.size == returnedArray.size ? (return true) : (return false)
    end

    def my_any?
        self.my_each do |element|
            return true if yield element
            false
        end
    end

    def my_none?
        self.my_each {|element| return false if yield(element)}
        true
    end

    def my_count(arg = nil)
        count = 0
        if !block_given? && !arg
            self.length
        elsif !block_given? && arg
            self.my_each { |element| count +=1 if element == arg }
        elsif block_given?
            self.my_each { |element| count+=1 if yield(element) }
        end
        count
    end

    def my_inject

    end

    def my_map(arg = nil)
        newArray = []
        self.my_each {|element| 
        if block_given?
            newArray.push(yield(element))
        elsif arg
            newArray.push(arg.call(element))
        end
        }
        newArray
    end


end #Enumerable

arr = [1,2,3]

double = Proc.new { |n| n * 2 }

# Test cases
# arr.my_each {|n| p  n * 2 }

#arr.my_each_with_index {|element, index| p "Index #{index}, elemento #{element}"   }

#p ["hola", "soy", "juan"].my_select {|letter| letter.size == 4 }

#p [5,6, false].my_any? { |n| n > 3 }

# p [1,2,3,2,2,2,2].my_count { |n| n % 2 == 0 }

# p arr.my_map(&double)

# p arr.my_map { |n| n*2}


