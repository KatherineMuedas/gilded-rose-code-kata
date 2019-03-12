SULFURAS = "Sulfuras, Hand of Ragnaros"
BACKSTAGE_PASSES = "Backstage passes to a TAFKAL80ETC concert"
AGED_BRIE = "Aged Brie"

def update_quality(items)
  items.each do |item|
    next if item.name == SULFURAS
    if item.name != AGED_BRIE && item.name != BACKSTAGE_PASSES
      if item.quality > 0
        item.quality -= 1
      end
    else
      increase_quality(item)
      if item.name == BACKSTAGE_PASSES
        if item.sell_in < 11
          increase_quality(item)
        end
        if item.sell_in < 6
          increase_quality(item)
        end
      end
    end

    item.sell_in -= 1
    if item.sell_in < 0
      if item.name != "Aged Brie"
        if item.name != BACKSTAGE_PASSES
          if item.quality > 0
            item.quality -= 1
          end
        else
          item.quality -= item.quality
        end
      else
        increase_quality(item)
      end
    end
  end
end

def increase_quality(item)
  if item.quality < 50
    item.quality += 1
  end
end

#----------------------------
# DO NOT CHANGE THINGS BELOW
#----------------------------

Item = Struct.new(:name, :sell_in, :quality)
