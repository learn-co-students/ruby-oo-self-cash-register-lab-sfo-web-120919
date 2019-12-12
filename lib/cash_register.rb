class CashRegister

    attr_accessor :discount, :items, :total, :last_transaction


    def initialize(discount = 20)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = nil
    end

    def add_item(title, price, quantity=1)
        @total += (price * quantity)
        quantity.times do
            items << title
        end
        @last_transaction = price * quantity
    end
    

    def apply_discount
        puts @discount
        if @discount != 0
            @total = @total - @total * @discount / 100.to_f
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def items
         @items
    end

    def void_last_transaction
         self.total = self.total - self.last_transaction
         @items.pop
         if @items.length == 0
            total = 0.0
         end
    end

end

