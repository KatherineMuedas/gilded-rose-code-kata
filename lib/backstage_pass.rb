require_relative 'gilded_rose'
require_relative 'normal'
class BackstagePass < Normal

  attr_reader :item

  def initialize(item)
    @item = item
  end

  def update
    increase_quality
    increase_quality if @item.sell_in < TEN_DAYS
    increase_quality if @item.sell_in < FIVE_DAYS
    @item.quality -= @item.quality if expired?
  end
end
