
class CashRegister
    attr_accessor :total, :discount, :sub_total

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @sub_total = 0
        @items = []
        @price_array = []
        #puts 'initialize @total #{@total}'
    end

    
    def add_item(title,price,quantity=1)
        @sub_total = price * quantity
        @total += @sub_total
        quantity.times{@items << title}
        @price_array << price

    end

    def apply_discount
        if @discount == 0.0 || @discount == 0
            return "There is no discount to apply."
        else
            @total = @total - ((@discount/100.0) * @total ) 
       
        return "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    def items
        return @items
    end

    def void_last_transaction
        if @items.length < 1
           @total = 0.0
        else
          @total -= @price_array.pop
        end
        puts @total
    end


end