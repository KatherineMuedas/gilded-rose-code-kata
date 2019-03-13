require_relative 'gilded_rose'
class Normal

  attr_reader :item

  def initialize(item)
    @item = item
  end

  def update
    if expired?
      decrease_twice_as_fast
    else
      decrease_quality
    end
  end

  def expired?
    @item.sell_in < ZERO_DAYS
  end

  def decrease_quality
    if @item.quality > 0
      @item.quality -= 1
    end
  end

  def decrease_twice_as_fast
    decrease_quality
    decrease_quality
  end

  def increase_quality
    if @item.quality < 50
      @item.quality += 1
    end
  end
end
