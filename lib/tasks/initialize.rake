namespace :acct do

  desc "Initialize Data"
  task :initialize => [ :environment ] do  
    asset_group_type = AccountGroupType.find_or_create_by_name('Assets')
    liability_group_type = AccountGroupType.find_or_create_by_name('Liabilities')        
    expense_group_type = AccountGroupType.find_or_create_by_name('Expense')      
    income_group_type = AccountGroupType.find_or_create_by_name('Income')      
    
    share_capital_acct_grp = AccountMainGroup.find_or_create_by_name('Share Capital')
    share_capital_acct_grp.update_attribute(:account_group_type_id, liability_group_type.id)
    
    reserves_and_surplus = AccountMainGroup.find_or_create_by_name('Reserves And Surplus')
    reserves_and_surplus.update_attribute(:account_group_type_id, liability_group_type.id)


    loans = AccountMainGroup.find_or_create_by_name('Loans')   
    loans.update_attribute(:account_group_type_id, liability_group_type.id)    
      secured_loan = AccountSubGroup.find_or_create_by_name('Secured Loans')
      secured_loan.update_attribute(:parent_id, loans.id)    
      unsecured_loan = AccountSubGroup.find_or_create_by_name('Unsecured Loans')
      unsecured_loan.update_attribute(:parent_id, loans.id)
    
    current_liability = AccountMainGroup.find_or_create_by_name('Current Liabilities')
    current_liability.update_attribute(:account_group_type_id, liability_group_type.id) 
        
    fixed_asset = AccountMainGroup.find_or_create_by_name('Fixed Assets')
    fixed_asset.update_attribute(:account_group_type_id, asset_group_type.id) 
    
    investment = AccountMainGroup.find_or_create_by_name('Investments')
    investment.update_attribute(:account_group_type_id, asset_group_type.id)
    
    current_assets = AccountMainGroup.find_or_create_by_name('Current Assets')
    current_assets.update_attribute(:account_group_type_id, asset_group_type.id)
      bank_accounts = AccountSubGroup.find_or_create_by_name('Bank Accounts') 
      bank_accounts.update_attribute(:parent_id, current_assets.id)
      cash_in_hand = AccountSubGroup.find_or_create_by_name('Cash-in Hand')
      cash_in_hand.update_attribute(:parent_id, current_assets.id)
      stock_in_hand = AccountSubGroup.find_or_create_by_name('Stock-in Hand')
      stock_in_hand.update_attribute(:parent_id, current_assets.id)      
      deposits = AccountSubGroup.find_or_create_by_name('Deposits')
      deposits.update_attribute(:parent_id, current_assets.id)
      sundry_debtors = AccountSubGroup.find_or_create_by_name('Sundry Debtors') 
      sundry_debtors.update_attribute(:parent_id, current_assets.id)
      
      
    loans_and_advances = AccountMainGroup.find_or_create_by_name('Loans And Advances')
    loans_and_advances.update_attribute(:account_group_type_id, asset_group_type.id)
    
    misc_expenditure = AccountMainGroup.find_or_create_by_name('Miscellaneous Expenditure And losses')
    misc_expenditure.update_attribute(:account_group_type_id, asset_group_type.id)
    
    profit_and_loss = AccountMainGroup.find_or_create_by_name('Profit And Loss Account')
    profit_and_loss.update_attribute(:account_group_type_id, asset_group_type.id)
    
    direct_income = AccountMainGroup.find_or_create_by_name('Direct Income')
    direct_income.update_attribute(:account_group_type_id, income_group_type.id)
    
    indirect_income = AccountMainGroup.find_or_create_by_name('Indirect Income')
    indirect_income.update_attribute(:account_group_type_id, income_group_type.id)    
    
    direct_expenses = AccountMainGroup.find_or_create_by_name('Direct Expenses')
    direct_expenses.update_attribute(:account_group_type_id, expense_group_type.id)
    
    sales_account = AccountMainGroup.find_or_create_by_name('Sales Account')
    sales_account.update_attribute(:account_group_type_id, expense_group_type.id)
    
    indirect_expense = AccountMainGroup.find_or_create_by_name('Indirect Expenses')
    indirect_expense.update_attribute(:account_group_type_id, expense_group_type.id)
    
    purchase_account = AccountMainGroup.find_or_create_by_name('Purchases Account')    
    purchase_account.update_attribute(:account_group_type_id, expense_group_type.id)
    
    AccountingPeriod.set_up_accounting_period
  end
end    

