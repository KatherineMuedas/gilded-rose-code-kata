require_relative 'aged_brie.rb'
SULFURAS = "Sulfuras, Hand of Ragnaros"
BACKSTAGE_PASSES = "Backstage passes to a TAFKAL80ETC concert"
AGED_BRIE = "Aged Brie"
CONJURED = "Conjured Mana Cake"
ZERO_DAYS = 0
FIVE_DAYS = 5
TEN_DAYS = 10


def update_quality(items)
  items.each do |item|
    next if item.name == SULFURAS
    item.sell_in -= 1
    if item.name == AGED_BRIE
      aged_brie = AgedBrie.new(item)
      aged_brie.update
    elsif item.name == BACKSTAGE_PASSES
      update_backstage_pass_quality(item)
    elsif item.name == CONJURED
      update_conjured_quality(item)
    else
      if expired?(item)
        decrease_twice_as_fast(item)
      else
        decrease_quality(item)
      end
    end
  end
end

def update_backstage_pass_quality(item)
  increase_quality(item)
  if item.sell_in < TEN_DAYS
    increase_quality(item)
  end
  if item.sell_in < FIVE_DAYS
    increase_quality(item)
  end
  if expired?(item)
    item.quality -= item.quality
  end
end

def update_conjured_quality(item)
  if expired?(item)
    decrease_twice_as_fast(item)
    decrease_twice_as_fast(item)
  else
    decrease_twice_as_fast(item)
  end
end

def increase_quality(item)
  if item.quality < 50
    item.quality += 1
  end
end

def decrease_quality(item)
  if item.quality > 0
    item.quality -= 1
  end
end

def expired?(item)
  item.sell_in < ZERO_DAYS
end

def decrease_twice_as_fast(item)
  decrease_quality(item)
  decrease_quality(item)
end

#----------------------------
# DO NOT CHANGE THINGS BELOW
#----------------------------

Item = Struct.new(:name, :sell_in, :quality)
