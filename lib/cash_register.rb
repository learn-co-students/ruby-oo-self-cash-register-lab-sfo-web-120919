class CashRegister
    attr_accessor :total,:discount, :sub_total
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @sub_total
        @reg_entry = []
    end
    def add_item(title,price,qty=1)
        @sub_total = price * qty
        @total += @sub_total
        qty.times{ @items << title }
        @reg_entry << {title => qty}
    end
    def apply_discount
        if @discount == 0 || @discount == 0.0
            message = "There is no discount to apply."
        else
            @total = @total - @total * @discount / 100.00
            message = "After the discount, the total comes to $#{@total.round}."
        end
        return message
    end
    def items
        @items
    end
    def void_last_transaction
        @total -= @sub_total
        @reg_entry.pop
    end
end

