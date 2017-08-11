class LRUCache

  def initialize(size)
    @size = size
    @cache = Array.new()
  end
  
  def add(element)
    if @cache.include?(element)
      @cache.delete(element)
    elsif @cache.count >= @size
      @cache.shift
    end
    @cache << element
  end

  def count
    @cache.size
  end

  def show
    puts @cache.to_s
  end
end
    johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})


  johnny_cache.show
