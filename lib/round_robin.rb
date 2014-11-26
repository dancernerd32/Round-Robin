require 'pry'
def create_all_pairs(names)
  all_pairs = []

  names.each_with_index do |name, index|
    all_pairs << [name]
    while index < names.length - 1
      index +=1
      all_pairs << [name, names[index]]
    end
  end
  all_pairs
end

def create_array(names)
  array = []
  n=0
  while n < names.length
    array << []
    n += 1
  end
  array
end

def odd_schedule_tournament(names)
  length = names.length
  arrays_index = 0
  all_pairs_index = 0
  n = 1
  m = length
  arrays = create_array(names)
  all_pairs = create_all_pairs(names)
  while all_pairs_index < all_pairs.length
    m.times do
      arrays_index %= length
      arrays [arrays_index] << all_pairs [all_pairs_index]
      all_pairs_index += 1
      arrays_index += 1
    end
    m -= 1
    n += 1
    arrays_index += n
  end
  arrays
end
# def add_pairs(names)
#   arrays = create_array(names)
#   all_pairs = create_all_pairs(names)
#   n = 0
#   while n < names.length
#     arrays[n] << all_pairs[n]
#     n += 1
#   end
#   arrays
# end


def schedule_tournament(names)
  if names.length%2 == 1
    odd_schedule_tournament(names)
  end
end


binding.pry
