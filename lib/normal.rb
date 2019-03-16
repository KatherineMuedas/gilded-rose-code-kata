require_relative 'gilded_rose'
class Normal

  attr_reader :item

  def initialize(item)
    @item = item
  end

  def update
    expired? ? decrease_twice_as_fast : decrease_quality
  end

  def expired?
    @item.sell_in < ZERO_DAYS
  end

  def decrease_quality
    @item.quality -= 1 if @item.quality > 0
  end

  def decrease_twice_as_fast
    decrease_quality
    decrease_quality
  end

  def increase_quality
    @item.quality += 1 if @item.quality < 50
  end
end
