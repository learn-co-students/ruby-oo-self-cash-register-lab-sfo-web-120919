class CashRegister
    attr_accessor :discount, :total

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @title
        @prices = []
    end

    def add_item(title, price, quantity = 1)
            self.total += price * quantity
            @prices << price
            quantity.times{@items << title}
    end

    def apply_discount
        self.total -= 0.20 * @total
        if discount > 0
            "After the discount, the total comes to $#{self.total.floor}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        self.total -= @prices.pop
    end
end
