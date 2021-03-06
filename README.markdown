Haskell-style monad do-notation for Ruby
========================================

Example:

    class Array
      include Monad
      
      def self.unit x
        [x]
      end
      
      def bind &f
        map(&f).inject([]){ |a,b| a+b }
      end
    end
    
    Array.run do
      x <- ["first", "second"]
      y <- ["once", "twice"]
  
      unit("#{x} cousin #{y} removed")
    end

The above code returns the array:

    ["first cousin once removed",
     "first cousin twice removed",
     "second cousin once removed",
     "second cousin twice removed"]

For more examples, see the test suite.

By Aanand Prasad (aanand.prasad@gmail.com)
