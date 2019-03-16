require_relative 'aged_brie.rb'
require_relative 'backstage_pass.rb'
require_relative 'conjured.rb'
require_relative 'normal.rb'

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

    case item.name
    when AGED_BRIE
      aged_brie = AgedBrie.new(item)
      aged_brie.update
    when BACKSTAGE_PASSES
      backstage = BackstagePass.new(item)
      backstage.update
    when CONJURED
      conjured = Conjured.new(item)
      conjured.update
    else
      normal = Normal.new(item)
      normal.update
    end
  end
end


#----------------------------
# DO NOT CHANGE THINGS BELOW
#----------------------------

Item = Struct.new(:name, :sell_in, :quality)
