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



end #Enumerable

arr = [25,45,55,36]

# Test cases
# arr.my_each {|n| p  n * 2 }

arr.my_each_with_index {|element, index| p "Index #{index}, elemento #{element}"   }

p ["hola", "soy", "juan"].my_select {|letter| letter.size == 4 }