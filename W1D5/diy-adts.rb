#############################
#
#  APP_ACADEMY W1D4 HMWK
#   DIY- ADTs
#
#  CHRISTOPHER STENQVIST
#  08/03/2017
#  SF- COHORT
#
#############################


class Stack
    def initialize
      # create ivar to store stack here!
      @stack = []
    end

    def add(el)
      # adds an element to the stack
      @stack.push(el)
    end

    def remove
      # removes one element from the stack
      @stack.pop
    end

    def show
      # return a copy of the stack
      @stack
    end
end



class Queue
  def initialize
    @queue=[]
  end

  def enqueue(el)
    @queue << el
  end
  
  def dequeue
    @queue.shift
  end

  def show
    @queue.last
  end
end

class Map
  def initialize
    @map = []
  end
  
  def assign(key,value)
    if exists?(key)
      p = get_pos(key)
      @map[p][1] = value
    else
      @map<<[key,value]
    end
  end

  def lookup(key)
    if exists?(key)
     @map[get_pos(key)][1]
    end
  end

  def remove(key)
    if exists?(key)
      i = get_pos(key)
      @map.delete_at(i)
    end
  end

  def show
    @map
  end

  private
  def get_pos(key)
    i=nil
    @map.each.with_index{|el,idx| i=idx if el[0] == key}
    i
  end
  def exists?(key)
    e=@map.select do | el |
      el[0] == key
    end
    !e.empty?
  end
end






