# Modeled after Andrzej Filinski's article "Representing
# Monads" at POPL'94, and a Scheme implementation of it.
# http://citeseer.ist.psu.edu/filinski94representing.html

module ShiftReset
  @@metacont = lambda { |x|
    raise RuntimeError, "You forgot the top-level reset..."
  }

  def reset(&block)
    mc = @@metacont
    callcc { |k|
      @@metacont = lambda { |v|
        @@metacont = mc
        k.call v
      }
      x = block.call
      @@metacont.call x
    }
  end

  def shift(&block)
    callcc { |k|
      @@metacont.call block.call(lambda { |*v| reset { k.call *v } })
    }
  end
end

include ShiftReset

module Monad
  module ClassMethods
    def run &block
      eval(ruby_for(block), block).call
    end

    def ruby_for block
      @cached_ruby ||= {}
      @cached_ruby[block.to_s] ||= "#{self.name}.instance_eval { #{Ruby2Ruby.new.process(Rewriter.new.process(block.to_method.to_sexp)[2])} }"
    end

    def sequence l
      if l.empty?
       unit([])
      else
         run do
           x <- l[0]
           q <- sequence(l[1..-1])
           unit([x] + q)
         end
      end
    end

    def foldM(i,l, &f)
      if l.empty?
       unit(i)
      else
         run do
           x <- f.call(i,l[0])
           foldM(x,l[1..-1]) { |a,b| f.call(a,b) }
         end
      end
    end

    def fmap f
      lambda { |m| m.bind { |y| unit(f.call(y)) } }
    end

    def reify &t
      reset { unit( t.call() ) }
    end

    def reflect m
      shift { |k| m.bind { |v| k.call(v) } }
    end
  end

  def self.included m
    m.extend ClassMethods
  end

  def bind_const &block
    bind { |_| block.call() }
  end

  def >> n
    bind_const { n }
  end

  def joinM
    bind { |n| n }
  end

  # I don't know why this reflect doesn't work
  # the class method seems to be the same and work
  # the evaluation moment of the shift in a class method
  # and in a method may be different
  def reflect_that_doesnt_work
    shift { |k| bind { |v| k.call(v) } }
  end
end