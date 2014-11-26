require 'pry'
def create_all_pairs(names)
  all_pairs = []

  if names.length % 2 == 1
    names.each_with_index do |name, index|
      all_pairs << [name]
      while index < names.length - 1
        index += 1
        all_pairs << [name, names[index]]
      end
    end



  else
    final_name_index = names.length - 1
    names.each_with_index do |name, index|
      while index < final_name_index - 1
        all_pairs << [name, names[final_name_index]]
        while index < names.length - 2
          index += 1
          all_pairs << [name, names[index]]
        end
      end
    end
    all_pairs << [names[names.length - 2], names[names.length - 1]]
  end
all_pairs
end

def create_rounds(names)
  array = []
  n=0
  if names.length % 2 == 1
    length = names.length
  else
    length = names.length - 1
  end
  while n < length
    array << []
    n += 1
  end
  array
end

def odd_schedule_tournament(names)
  length = names.length
  rounds_index = 0
  all_pairs_index = 0
  n = 1
  m = length
  rounds = create_rounds(names)
  all_pairs = create_all_pairs(names)
  while all_pairs_index < all_pairs.length
    m.times do
      rounds_index %= length
      rounds [rounds_index] << all_pairs [all_pairs_index]
      all_pairs_index += 1
      rounds_index += 1
    end
    m -= 1
    n += 1
    rounds_index += n
  end
  rounds
end

def even_schedule_tournament(names)
  length = names.length - 1
  rounds_index = 0
  all_pairs_index = 0
  n = 1
  m = length
  rounds = create_rounds(names)
  all_pairs = create_all_pairs(names)
  while all_pairs_index < all_pairs.length
    m.times do
      rounds_index %= length
      rounds [rounds_index] << all_pairs [all_pairs_index]
      all_pairs_index += 1
      rounds_index += 1
    end
    m -= 1
    n += 1
    rounds_index += n
  end
  rounds
end

def schedule_tournament(names)
  if names.length % 2 == 1
    odd_schedule_tournament(names)
  else
    even_schedule_tournament(names)
  end
end
