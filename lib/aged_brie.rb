require_relative 'gilded_rose'
class AgedBrie

  attr_reader :item

  def initialize(item)
    @item = item
  end

  def update
    increase_quality
    increase_quality if expired?
  end

  def increase_quality
    if @item.quality < 50
      @item.quality += 1
    end
  end

  def expired?
    @item.sell_in < ZERO_DAYS
  end
end
