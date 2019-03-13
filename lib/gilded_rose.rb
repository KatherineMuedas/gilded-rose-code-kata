require_relative 'aged_brie.rb'
require_relative 'backstage_pass.rb'
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
      backstage = BackstagePass.new(item)
      backstage.update
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
