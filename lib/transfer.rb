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
    if @sender.balance > @amount && @status == "pending" 
      @sender.balance -= @amount 
      @receiver.balance += @amount
      @status = "complete"
    if @sender.balance <= @amount || @status == "closed"
       @status = "rejected"
      "Transaction rejected. Please check your account balance."
    else 
    end 
  end 
  
   
 
end

