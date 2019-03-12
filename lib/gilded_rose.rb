SULFURAS = "Sulfuras, Hand of Ragnaros"
BACKSTAGE_PASSES = "Backstage passes to a TAFKAL80ETC concert"
AGED_BRIE = "Aged Brie"

def update_quality(items)
  items.each do |item|
    next if item.name == SULFURAS
    if item.name == AGED_BRIE
      increase_quality(item)
    elsif item.name == BACKSTAGE_PASSES
      increase_quality(item)
      if item.sell_in < 11
        increase_quality(item)
      end
      if item.sell_in < 6
        increase_quality(item)
      end
    else
      decrease_quality(item)
    end

    item.sell_in -= 1

    if item.sell_in < 0
      if item.name == AGED_BRIE
        increase_quality(item)
      elsif item.name == BACKSTAGE_PASSES
        item.quality -= item.quality
      else
        decrease_quality(item)
      end
    end
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

#----------------------------
# DO NOT CHANGE THINGS BELOW
#----------------------------

Item = Struct.new(:name, :sell_in, :quality)
