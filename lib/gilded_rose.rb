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
      if item.quality < 50
        item.quality += 1
        if item.name == BACKSTAGE_PASSES
          if item.sell_in < 11
            if item.quality < 50
              item.quality += 1
            end
          end
          if item.sell_in < 6
            if item.quality < 50
              item.quality += 1
            end
          end
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
        if item.quality < 50
          item.quality += 1
        end
      end
    end
  end
end

#----------------------------
# DO NOT CHANGE THINGS BELOW
#----------------------------

Item = Struct.new(:name, :sell_in, :quality)
