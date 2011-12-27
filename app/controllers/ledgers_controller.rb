class LedgersController < ApplicationController

  def show
    @account = user_default_branch.accounts.find(params[:id])
    @account_transaction_items = AccountTransactionItem.find(:all, 
                                                             :select => "a1.account_id, case when a1.parent_id = -1 then a2.amount else a1.amount end as 'amount', a1.category, a1.account_id, a1.account_transaction_id",
                                                             :joins => "a1 inner join account_transaction_items a2 on a1.account_transaction_id = a2.account_transaction_id",
                                                             :include => [:account, :account_transaction],
                                                             :conditions => ["a1.account_id != ? and a2.account_id = ? and a1.parent_id != a2.parent_id", @account, @account])
  end
end
