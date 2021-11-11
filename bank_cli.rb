require_relative "./bank_account"

puts "Enter first and last name:"
name = gets.chomp
puts "Enter deposit amount:"
deposit = gets.chomp

new_account = BankAccount.new(deposit, name)

options = "\nWhat would you like to do next?\n\nType D for Deposit, W for Withdraw, T for Transfer, or E for Exit."

puts "\nWelcome to your new account with Ruby Banking, #{new_account.name}! Your available balance is $#{'%.2f' % new_account.balance}. \n#{options}"

valid_choices = ["D", "W", "T", "E"]

user_choice = gets.chomp.upcase

until valid_choices.include? user_choice
    puts "\nSorry, that's not a valid choice."
    puts "#{options}"
    user_choice = gets.chomp.upcase
end

if valid_choices.include? user_choice
    case user_choice 
    when "D"
        puts "You chose deposit. Please enter a deposit amount."
    when "W"
        puts "You chose withdraw. Please enter a withdraw amount."
    when "T"
        puts "You chose transfer. Please enter the first and last name of the account holder you wish you transfer money to."
        transfer_account = gets.chomp
        found_account = BankAccount.find_account(transfer_account)
        if found_account 
            puts "\nHow much money would you like to transfer to #{found_account.name}?"
            transfer_amount = gets.chomp.to_i
            if transfer_amount > new_account.balance
                puts "\nYour account balance is $#{'%.2f' % new_account.balance}. You cannot transfer #{transfer_amount}. Goodbye."
            end
          else 
            puts "Sorry, no account exists for #{transfer_account}. Goodbye."
          end 
    when "E"
        puts "You chose exit. Goodbye!"
    end
end