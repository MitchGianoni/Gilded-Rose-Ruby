class GildedRose
  attr_reader :name, :days_remaining, :quality

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
    return if @name == "Sulfuras, Hand of Ragnaros"
    if not_brie_or_tickets
      decrease_quality_for_nonspecial_items
    elsif @quality < 50
      increase_quality_for_special_items
    end
    
    decrease_days_remaining
    
    if @days_remaining < 0
      modify_quality
    end
  end

  private

  def decrease_days_remaining
      @days_remaining = @days_remaining - 1
  end

  def decrease_quality_for_nonspecial_items
    if @quality > 0
      if @name == "Conjured Mana Cake"
        @quality -= 2
      else
        @quality -= 1
      end
    end
  end

  def increase_quality_for_special_items
    @quality += 1
    if @name == "Backstage passes to a TAFKAL80ETC concert"
      if @days_remaining < 11
        if @quality < 50
          @quality += 1
        end
      end
        if @days_remaining < 6
          if @quality < 50
            @quality += 1
          end
        end
    end
  end

  def modify_quality
    if @name != "Aged Brie"
      if @name != "Backstage passes to a TAFKAL80ETC concert"
        if @quality > 0
          if @name == "Conjured Mana Cake"
            @quality -= 2
          else
            @quality -= 1
          end
        end
      else
        @quality = @quality - @quality
      end
    elsif @quality < 50
        @quality += 1
    end
  end

  def not_brie_or_tickets
    @name != "Aged Brie" and @name != "Backstage passes to a TAFKAL80ETC concert"
  end
end
