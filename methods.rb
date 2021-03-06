#Global Variables
$transactions = []
$balance = 0

#Building the Class
class Transaction
  attr_accessor :payee, :amount, :date, :category
  def initialize(payee, amount, date, category)
    @payee = payee
    @amount = amount
    @date = date
    @category = category
  end
end

#List Transactions
def list_transactions
  puts "Here is a list of your existing transactions:"
  p $transactions
end

#Add Transaction
def add_transaction(payee, amount, date, category)
  $transactions << Transaction.new(payee, amount, date, category)
  $balance += amount.to_i
end
add_transaction("John", 40, "1/12/2017", "food")
add_transaction("Mike", -20, "1/13/2017", "transportation")
add_transaction("Mark", 200, "1/14/2017", "fun")
add_transaction("Jane", -10, "1/15/2017", "food")

#Delete Transaction
def delete_transaction(index)
  $transactions.delete_at(index)
  # p $transactions
end

#Edit Transaction
def edit_transaction
  puts "Here are the existing transactions:"
  p $transactions
  puts "What is the index number of the transaction you want to edit?"
  user_input = gets.chomp.to_i
  puts "You chose this transaction:"
  p $transactions[user_input]
  puts "Which part of the transaction do you want to edit?"
  puts "To edit the payee type 1"
  puts "To edit the amount type 2"
  puts "To edit the date type 3"
  puts "To edit the category type 4"
  user_input2 = gets.chomp.to_i
  if user_input2 == 1
    puts "What is the new name of the payee for this transaction?"
    user_input3 = gets.chomp.to_s
    $transactions[user_input].payee = user_input3
    puts "Your transaction was updated. Here are your updated transactions:"
    p $transactions
  elsif user_input2 == 2
    puts "What is the new amount of this transaction?"
    user_input4 = gets.chomp.to_i
    $balance -= $transactions[user_input].amount
    $transactions[user_input].amount = user_input4
    $balance += user_input4
    puts "Your transaction was updated. Here are your updated transactions:"
    p $transactions
    puts "Your current balance is:"
    p $balance
  elsif user_input2 == 3
    puts "What is the new date of this transaction?"
    user_input5 = gets.chomp.to_s
    $transactions[user_input].date = user_input5
    puts "Your transaction was updated. Here are your updated transactions:"
    p $transactions
  elsif user_input2 == 4
    puts "What is the new category this transaction?"
    user_input6 = gets.chomp.to_s
    $transactions[user_input].category = user_input6
    puts "Your transaction was updated. Here are your updated transactions:"
    p $transactions
  else
    puts "Sorry! I didn't understand this. Please try again!"
    edit_transaction
  end
end

#Display current balance
def display_balance
  puts "Your current balance is #{$balance} Dollars!"
end

#List Transactions by category
def list_by_category(num)
  by_category = []
  for transaction in $transactions
    if transaction.category == num
      by_category << transaction
    else
      next
    end
  end
  puts "Here are your transactions in category #{num}"
  p by_category
  category_cost = 0
  puts "Here is the cost of transactions in this category:"
  for ruby_transaction in by_category
    category_cost += ruby_transaction.amount
  end
  p category_cost
end
