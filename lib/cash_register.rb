require 'pry'
class CashRegister
    attr_accessor :total, :discount, :items

    def initialize(discount = 0)
        @total = 0 
        @discount = discount
        @items = []
        @prices = []
        
    end

    def add_item(title, price, quantity = 1)
        # increase total by items price
        @total += price * quantity
        # add the item to the items array
        
        quantity.times {@items << title}
        quantity.times {@prices << price}

    end

    def apply_discount 
        if @discount > 0 # there is a discount
            @total = @total - (@total * (@discount / 100.0)) 
            str = "After the discount, the total comes to $#{@total.to_i}."
        else # no discount
           return "There is no discount to apply."
        end
        return str 
    end

    def void_last_transaction
        
       if @items.empty?
            @total = 0.0
       else # not empty 
            # substract price of the last item from @total
            @total = @total - @prices[-1]
            # remove the last item in @items 
            @items.pop()
       end
    end

   




end
