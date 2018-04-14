class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      case item.name
      when "Aged Brie"
        if item.quality < 50
          plus(item)
          item.sell_in -= 1
          plus(item) if item.sell_in < 0
        end
      when "Sulfuras, Hand of Ragnaros"
      when "Conjured Mana Cake"
        item.sell_in -= 1
        minus(item, 2) if item.quality > 0
      when "Backstage passes to a TAFKAL80ETC concert"
        plus(item) if item.quality < 50
        if item.quality < 50
          if item.sell_in < 6
            plus(item, 2)
          elsif item.sell_in < 11
            plus(item)
          end
        end
        item.sell_in -= 1
        minus(item, item.quality) if item.sell_in < 0
      else
        minus(item) if item.quality > 0
        item.sell_in -= 1
        minus(item) if item.quality > 0 && item.sell_in < 0
      end
    end
  end

  def minus(item, num = 1)
    item.quality -= num
  end

  def plus(item, num = 1)
    item.quality += num
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name    = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
