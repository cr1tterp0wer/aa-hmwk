
#n^2 complexity
#
def my_min(list)
  min = list.first

  list.each.with_index do |el,idx|
    min = el
    list.each.with_index do |e,i|
      min = e if min > e
    end
  end
  min
end
list = [0, 3, 5, 4, -5, 10, 1, 90]

puts my_min(list)

#n complexity

def my_min_better(list)

  min = list.first

  list.each do |e|
    min = e if e < min 
  end
  min
end

puts my_min_better(list)








