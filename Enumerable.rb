module Enumerable
    def my_each
      for i in 0..self.length-1
        yield(self[i])
      end
    end
    
    def my_each_with_index
        for i in 0..self.length-1
            yield(self[i], i)
        end
    end

    def my_select
        array = []
        self.my_each do |x|
            if yield(x)
                array << x
            end
        end
        array
    end
    def my_all?
        bool = true
        self.my_each do |x|
            if !yield(x)
                bool = false
            end
        end
        bool
    end
    def my_any?
        bool = false
        self.my_each do |x|
            if yield(x)
                bool = true
            end
        end
        bool
    end
    def my_none?
        bool = true
        self.my_each do |x|
            if !yield(x)
                bool= false
            end
        end
        bool
    end

    def my_count?
        count = 0
        self.my_each do |x|
            if yield(x)
                count = count + 1
            end
        end
        count
    end

    def my_map(&block)
        array = []
        self.my_each do |x|
            array.push(yield(x))
        end
        array
    end

    def my_inject (*item)
        acc = self[0]
        for x in self[1..self.length] do
            acc=yield(acc, x)
        end
        return acc
    end
end

def multiply_els(list)
    return list.my_inject(1) { |acc, nr| acc*nr}
end

puts "Enumerate Methods: "
puts "my_each method imp -> "
[8,2,5,4].my_each{ |num| puts num }

puts "my_each_with_index -> "
[8,2,5,4].my_each_with_index{ |num, ind| puts "Elem: #{num} and it's index: #{ind}" }

puts "my_select method by using my_each -> "
strings = %w(ruby html javascript)
p ss = strings.my_select {|words| words.include?("r") }

puts "my_all? method by using my_each -> "
p ["ab","abc","abcdta"].my_all? { |x| x.length >= 2 }

puts "my_any? method by using my_each -> "
p ["Ariel","Camus","Gaby","Willow","Lydia"].my_any? {|a| a.include?("y") }

puts "my_none? method by using my_each -> "
p ["ab","abc","abcdta"].my_none? { |x| x.length < 2 }

puts "my_count? method by using my_each -> "
puts "How many numbers are even? "
p [2,5,8,6,4,1,2,3].my_count?{ |x| x%2==0 }
puts "How many words in array?"
p ["ab","abc","abcdta"].my_count?{|x| true}

puts "my_map method by using my_each -> "
puts "Double current values!"
p [2,5,8,6,4,1,2,3].my_map { |num| num*2 }

puts "multiply_els method using my_inject -> "
var1 = multiply_els([2,4,5])
print var1
puts ""

puts "my_inject method -> "
p [2,4,5].my_inject {|a,b| a*b}