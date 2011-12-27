class DayBooksController < ApplicationController
  def show
    @date_for = current_day.for_date
    credit_transactions_set_1 = user_default_branch.account_transaction_items.scoped_by_transaction_date(@date_for).find(:all, 
                    :select => "a2.transaction_type, case when account_transaction_items.transaction_type = 'C' then a2.account_id else account_transaction_items.account_id end as 'account_id', SUM(account_transaction_items.amount) as 'amount', account_transaction_items.category, account_transaction_items.account_transaction_id", 
                    :joins => "inner join account_transaction_items a2 on account_transaction_items.parent_id = a2.id", 
                    :conditions => "account_transaction_items.category = 'Credit' and account_transaction_items.transaction_type != 'C'", 
                    :group => "account_transaction_id, account_id, a2.transaction_type")

    credit_transactions_set_2 = user_default_branch.account_transaction_items.scoped_by_transaction_date(@date_for).find(:all, 
                    :select => "a2.transaction_type, case when account_transaction_items.transaction_type = 'C' then a2.account_id else account_transaction_items.account_id end as 'account_id', SUM(a2.amount) as 'amount', account_transaction_items.category, account_transaction_items.account_transaction_id", 
                    :joins => "inner join account_transaction_items a2 on account_transaction_items.id = a2.parent_id", 
                    :conditions => "account_transaction_items.category = 'Credit' and account_transaction_items.parent_id = -1  and account_transaction_items.transaction_type = 'G'", 
                    :group => "account_transaction_id, account_id, a2.transaction_type")

    @credit_transactions = credit_transactions_set_1
    @credit_transactions << credit_transactions_set_2
    @credit_transactions.flatten!

    debit_transactions_set_1 = user_default_branch.account_transaction_items.scoped_by_transaction_date(@date_for).find(:all, 
:select => "a2.transaction_type, case when account_transaction_items.transaction_type = 'C' then a2.account_id else account_transaction_items.account_id end as 'account_id', SUM(account_transaction_items.amount) as 'amount', account_transaction_items.category, account_transaction_items.account_transaction_id", 
:joins => "inner join account_transaction_items a2 on account_transaction_items.parent_id = a2.id", 
:conditions => "account_transaction_items.category = 'Debit' and account_transaction_items.transaction_type != 'C'", 
:group => "account_transaction_id, account_id, a2.transaction_type")

    debit_transactions_set_2 = user_default_branch.account_transaction_items.scoped_by_transaction_date(@date_for).find(:all, 
                    :select => "a2.transaction_type, case when account_transaction_items.transaction_type = 'C' then a2.account_id else account_transaction_items.account_id end as 'account_id', SUM(a2.amount) as 'amount', account_transaction_items.category, account_transaction_items.account_transaction_id", 
                    :joins => "inner join account_transaction_items a2 on account_transaction_items.id = a2.parent_id", 
                    :conditions => "account_transaction_items.category = 'Debit' and account_transaction_items.parent_id = -1  and account_transaction_items.transaction_type = 'G'", 
                    :group => "account_transaction_id, account_id, a2.transaction_type")


    @debit_transactions = debit_transactions_set_1
    @debit_transactions << debit_transactions_set_2
    @debit_transactions.flatten!    
  end
end
