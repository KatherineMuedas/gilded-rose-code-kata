require_relative 'gilded_rose'
class BackstagePass

  attr_reader :item

  def initialize(item)
    @item = item
  end

  def update
    increase_quality
    if @item.sell_in < TEN_DAYS
      increase_quality
    end
    if @item.sell_in < FIVE_DAYS
      increase_quality
    end
    if expired?
      @item.quality -= @item.quality
    end
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
