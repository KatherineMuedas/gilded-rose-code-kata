require_relative 'gilded_rose'
require_relative 'normal'
class Conjured < Normal

  attr_reader :item

  def initialize(item)
    @item = item
  end

  def update
    if expired?
      decrease_twice_as_fast
      decrease_twice_as_fast
    else
      decrease_twice_as_fast
    end
  end
end
