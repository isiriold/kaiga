class ReceiptVoucherEntry < AccountTransaction
  attr_accessor :cash_or_bank_account_id, :particular_0, :particular_1, :particular_2, :particular_3, :particular_4
  attr_accessor :particular_5, :particular_6, :particular_7, :particular_8, :particular_9, :particular_10
  attr_accessor :amount_0, :amount_1, :amount_2, :amount_3, :amount_4, :amount_5, :amount_6, :amount_7, :amount_8
  attr_accessor :amount_9, :amount_10
  attr_accessor :inventory_item_0, :inventory_item_1, :inventory_item_2, :inventory_item_3, :inventory_item_4
  attr_accessor :inventory_item_amt_0, :inventory_item_amt_1, :inventory_item_amt_2
  attr_accessor :inventory_item_amt_3, :inventory_item_amt_4

  attr_accessible :cash_or_bank_account_id, :particular_0, :particular_1, :particular_2, :particular_3, :particular_4
  attr_accessible :particular_5, :particular_6, :particular_7, :particular_8, :particular_9, :particular_10
  attr_accessible :amount_0, :amount_1, :amount_2, :amount_3, :amount_4, :amount_5, :amount_6, :amount_7, :amount_8
  attr_accessible :amount_9, :amount_10  
  attr_accessible :inventory_item_0, :inventory_item_1, :inventory_item_2, :inventory_item_3, :inventory_item_4
  attr_accessible :inventory_item_amt_0, :inventory_item_amt_1, :inventory_item_amt_2
  attr_accessible :inventory_item_amt_3, :inventory_item_amt_4

  def save
    transaction_items = []
    i = 0
    total_amt = 0
    10.times do
      acc_name = eval("particular_#{i}")
      amt = BigDecimal(eval("amount_#{i}"))
      unless acc_name.blank?
        account = branch.accounts.find_by_name(acc_name)
        if account.blank?
          errors.add("particular_#{i}".to_sym, " cannot find account with name #{acc_name}")
        else
          transaction_items << {:account_id => account.id, :category => 'Debit', :amount => amt}
          total_amt += amt
        end
      end
      i += 1
    end
    transaction_items << {:account_id => cash_or_bank_account_id, :category => 'Credit', :amount => total_amt}
    self.account_transaction_items_attributes = transaction_items
    super
  end

end
