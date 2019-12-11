
class CashRegister
  attr_accessor :total, :discount
  attr_writer :items

  def initialize(discount = 20)
    @total = 0
    @discount = discount
    @items = []
  end

  def items
    @items.map { |item| item[:title] }
  end

  def add_item(title, price, quantity = 1)
    @total += price * quantity
    quantity.times do
      @items << { title: title, price: price }
    end
  end

  def apply_discount()
    puts @discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total = @total - ((@discount / 100.0) * @total)
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def void_last_transaction
    if !items.empty?
      @total = @total - @items[-1][:price]
      puts("before delete", items.count)
      @items.delete_at(-1)
      puts("after delete", items.count)
      if items.empty?
        @total = 0.0
      end
    end
  end
end
