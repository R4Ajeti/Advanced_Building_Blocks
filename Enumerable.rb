# frozen_string_literal: true

module Enumerable
  def my_each
    (0..length - 1).each do |i|
      yield(self[i])
    end
  end

  def my_each_with_index
    (0..length - 1).each do |i|
      yield(self[i], i)
    end
  end

  def my_select
    array = []
    my_each do |x|
      array << x if yield(x)
    end
    array
  end

  def my_all?
    bool = true
    my_each do |x|
      bool = false unless yield(x)
    end
    bool
  end

  def my_any?
    bool = false
    my_each do |x|
      bool = true if yield(x)
    end
    bool
  end

  def my_none?(*args)
    bool = false
    my_each do |x|
      case args.length
      when 0
        bool = !yield(x) if block_given?
        break unless bool
      when 1
        bool = true if x == args.first
      else
        raise ArgumentError
      end
    end
    bool
  end

  def my_count(*args)
    count = 0
    case args.length
    when 0
      my_each do |x|
        if block_given?
          count += 1 if yield(x)
        else
          count += 1
        end
      end
    when 1
      my_each do |x|
        count += 1 if args.first == x
      end
    else
      raise ArgumentError
    end
    count
  end

  def my_count?
    count = 0
    my_each do |x|
      count += 1 if yield(x)
    end
    count
  end

  def my_map
    array = []
    my_each do |x|
      array.push(yield(x))
    end
    array
  end

  def my_inject(*_item)
    acc = self[0]
    self[1..length].each do |x|
      acc = yield(acc, x)
    end
    acc
  end
end

def multiply_els(list)
  list.my_inject(1) { |acc, nr| acc * nr }
end

puts 'Enumerate Methods: '
puts 'my_each method imp -> '
[8, 2, 5, 4].my_each { |num| puts num }

puts 'my_each_with_index -> '
[8, 2, 5, 4].my_each_with_index { |num, ind| puts "Elem: #{num} and it's index: #{ind}" }

puts 'my_select method by using my_each -> '
strings = %w[ruby html javascript]
p ss = strings.my_select { |words| words.include?('r') }

puts 'my_all? method by using my_each -> '
p %w[ab abc abcdta].my_all? { |x| x.length >= 2 }

puts 'my_any? method by using my_each -> '
p %w[Ariel Camus Gaby Willow Lydia].my_any? { |a| a.include?('y') }

puts 'my_none? method by using my_each -> without blocks '
p %w[ab abc abcdta].my_none? { |x| x.length < 2 }
puts 'my_none? method by using my_each -> with arguments'
p [2, 5, 8, 6, 4, 1, 2, 3].my_none?(9)

puts 'my_count? method by using my_each -> '
puts 'How many numbers are even? '
p [2, 5, 8, 6, 4, 1, 2, 3].my_count?(&:even?)
puts 'How many words in array?'
p %w[ab abc abcdta].my_count? { |_x| true }
puts 'How many 2 in array? using count?'
p [2, 5, 8, 6, 4, 1, 2, 3].my_count? { |x| x == 2 }

puts 'How many 2 in array? using count '
p [2, 5, 8, 6, 4, 1, 2, 3].my_count(2)

puts 'my_map method by using my_each -> '
puts 'Double current values!'
p [2, 5, 8, 6, 4, 1, 2, 3].my_map { |num| num * 2 }

puts 'multiply_els method using my_inject -> '
var1 = multiply_els([2, 4, 5])
print var1
puts ''

puts 'my_inject method -> '
p [2, 4, 5].my_inject { |a, b| a * b }

puts 'my_none?, my_count methods with arguments!!!!! -> '
p [1, 2, 3, 4, 5].my_none?(2)
p [1, 2, 3, 4, 5].my_count(2)
puts '[1,2,3,4,5,6,7,8].my_count'
p [1, 2, 3, 4, 5, 6, 7, 8].my_count
puts '[1,2,3,4,5,6,7,8].my_none? { |num| num > 10}'
p [1, 2, 3, 4, 5, 6, 7, 8].my_none? { |num| num > 10 }
puts '[1,2,3,4,5,6,7,8].none? { |num| num > 10}'
p [1, 2, 3, 4, 5, 6, 7, 8].none? { |num| num > 10 }
puts '[1,2,3,4,5,6,7,8].count { |x| x.even? }'
p [1, 2, 3, 4, 5, 6, 7, 8].count(&:even?)
puts '[1,2,3,4,5,6,7,8].my_count { |x| x.even? }'
p [1, 2, 3, 4, 5, 6, 7, 8].my_count(&:even?)
