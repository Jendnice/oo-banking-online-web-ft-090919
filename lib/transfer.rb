require 'pry'

class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount 
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver 
    @status = "pending"
    @amount = amount 
  end 
  
  def valid?
    @sender.valid? && @receiver.valid? ? true : false 
  end 

  
  def execute_transaction
    if !(sender.valid?)
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif sender.valid? && @sender.balance > @amount && @status == "pending" 
      @sender.balance -= @amount 
      @receiver.deposit(@amount)
      @status = "complete"
    else sender.valid? && @status == "complete"
      puts "This transaction has already been completed."
    end   
 end   
      
      
      
      
  #   if sender.valid? && @sender.balance > @amount && @status == "pending" 
  #     @sender.balance -= @amount 
  #     @receiver.deposit(@amount)
  #     @status = "complete"
  #   elsif sender.valid? && @status == "complete"
  #     puts "This transaction has already been completed."
  #   else !(sender.valid?) 
  #     return "Transaction rejected. Please check your account balance."
  #     @status = "rejected"
  #   end 
  # end 
  
  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
   
 
end

