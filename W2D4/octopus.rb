
class Array


  def merge_sort(&prc)
    prc ||= Array.new(){|x,y|x<=>y}
    return self if length <=1 
    midpoint = self.count/2

    left_side = self.take(midpoint).merge_sort(&prc)
    right_side = self.drop(midpoint).merge_sort(&prc)

    Array.merge(left_side,right_side, &prc)

  end
  
  private
  def self.merge(left, right, &prc)
   
    merged = []
    until left.empty? or right.empty?
  
      case prc.call(left.first,right.first)
      when 1
        merged << left.shift
      when 0 
        merged << left.shift
      when -1
        merged << right.shift
      end
    end
    merged.concat(left)
    merged.concat(right)
    merged
  end

end







def sluggish_octopus 

 fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
 
 tmp = ""
 fish.each.with_index do |f1,i1|
   fish.each.with_index do |f2,i2|
    tmp =  fish[i2] if fish[i1].length < fish[i2].length
   end
 end
tmp
end

puts sluggish_octopus


def dominant_octopus

 fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
 
 prc = Proc.new(){|x,y| x.length <=> y.length }
 f = fish.merge_sort(&prc)
 f.first

end

puts dominant_octopus





def clever_octopus

  fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
  hash = Hash.new(){}

  fish.each.with_index do |f,i|
    hash[f.length] = f
  end
  
  hash[hash.keys.max]
end

puts clever_octopus





def slow_dance(dir)
  k=""
  tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
  tiles_array.each.with_index do |el,idx|
    k = idx if el == dir
  end
  k
end

puts slow_dance("up")


def constant_dance(dir)

   tiles = {
    "up"=>0,
    "right-up"=>1,
    "right"=>2,
    "right-down"=>3,
    "down"=>4,
    "left-down"=>5,
    "left"=>6,
    "left-up"=>7
   }
   tiles[dir]
end



puts constant_dance("up")




