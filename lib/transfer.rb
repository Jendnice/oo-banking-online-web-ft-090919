require 'pry'

class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount 
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver 
    @status = "pending"
    @amount = amount 
  end 
  
  def both_valid?
    @sender.valid? && @receiver.valid? ? true : false 
  end 

  # def execute_transaction
  #   if @sender.balance > @amount && @status == "pending" 
  #     @sender.balance -= @amount 
  #     @receiver.balance += @amount
  #     @status = "complete"
  #   else close_account = true   
  #     @status = "rejected"
  #     return "Transaction rejected. Please check your account balance."
  #   end 
  # end 
  
  def execute_transaction
    if close_account = true 
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    else close_account != true && @sender.balance > @amount && @status == "pending"
      @sender.balance -= @amount 
      @receiver.balance += @amount
      @status = "complete"
    end 
  end 
  
   
 
end

