class CashRegister
     attr_accessor :total, :employee_discount, :last_transaction_amount
   
     def initialize(employee_discount = 0)
       @total = 0
       @employee_discount = employee_discount
       @items = []
       @last_transaction_amount = 0
     end
   
     def add_item(title, price, quantity = 1)
       item_total = price * quantity
       @total += item_total
       @last_transaction_amount = item_total
       quantity.times { @items << { title: title, price: price } }
     end
   
     def apply_discount
       if @employee_discount > 0
         discount_amount = (@total * @employee_discount / 100).round(2)
         @total -= discount_amount
         "After the discount, the total comes to $#{@total}."
       else
         "There is no discount to apply."
       end
     end
   
     def items
       @items.map { |item| item[:title] }
     end
   
     def void_last_transaction
       @total -= @last_transaction_amount
       @last_transaction_amount = 0
       @total = 0.0 if @items.empty?
     end
   end
