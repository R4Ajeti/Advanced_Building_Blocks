# Advanced Building Blocks

#### [Assignment link](https://www.theodinproject.com/courses/ruby-programming/lessons/advanced-building-blocks)

#### [View in broswer](https://AdvancedBuildingBlocks.r4ajeti.repl.run)

# Language

Ruby

## Solo Project 1: Enumerable methods.

You learned about the Enumerable module that gets mixed into the Array and Hash classes (among others) and provides you with lots of handy iterator methods. To prove that there’s no magic to it, you’re going to rebuild those methods.

## Assignment

* Create a script file to house your methods and run it in IRB to test them later.
* Add your new methods onto the existing Enumerable module. Ruby makes this easy for you because any class or module can be added to without trouble … just do something like:
  module Enumerable
    def my_each
      # your code here
    end
  end
* Create #my_each, a method that is identical to #each but (obviously) does not use #each. You’ll need to remember the yield statement. * Make sure it returns the same thing as #each as well.
* Create #my_each_with_index in the same way.
* Create #my_select in the same way, though you may use #my_each in your definition (but not #each).
* Create #my_all? (continue as above)
* Create #my_any?
* Create #my_none?
* Create #my_count
* Create #my_map
* Create #my_inject
* Test your #my_inject by creating a method called #multiply_els which multiplies all the elements of the array together by using   #my_inject, e.g. multiply_els([2,4,5]) #=> 40
* Modify your #my_map method to take a proc instead.
* Modify your #my_map method to take either a proc or a block. It won’t be necessary to apply both a proc and a block in the same #my_map call since you could get the same effect by chaining together one #my_map call with the block and one with the proc. This approach is also clearer, since the user doesn’t have to remember whether the proc or block will be run first. So if both a proc and a block are given, only execute the proc.


#### Authors
* [Rinor Ajeti](https://github.com/R4Ajeti)

#### Contact
* +383 44903320
* [E-mail](mailto:r4ajeti@gmail.com)
* [Facebook](https://www.facebook.com/r4ajeti)
* [Linkedin](https://www.linkedin.com/in/rinor-ajeti-79b6a8162)
* [Twitter](https://twitter.com/r4ajeti)

:¨·.·¨:   :¨·.·¨:
`·. ƮϦαɳk Ψөu .·`
