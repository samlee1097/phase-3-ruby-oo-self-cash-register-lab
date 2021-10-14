class CashRegister
    attr_accessor :total, :discount,:last_transaction_price

    def initialize (discount=0)
        @total = 0
        @discount = discount
        @cash_register = []
    end

    def total
        @total
    end

    def add_item(item, price, quantity=1)
        self.last_transaction_price = price * quantity
        self.total += self.last_transaction_price
        quantity.times do
            self.items << item
        end
    end

    def apply_discount
        if @discount == 0
            "There is no discount to apply."
        else
            @total *= (100 - @discount)/100.0
            "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    def items
        @cash_register
    end

    def void_last_transaction
        self.items.pop
        self.total -= self.last_transaction_price
        self.total < 0 ? self.total = 0 : nil
    end
end