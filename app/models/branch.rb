class Branch < ActiveRecord::Base
  has_many :users
  has_many :accounting_periods
  has_many :accounting_days
  has_many :accounts
  has_many :account_main_groups
  has_many :account_groups
  has_many :account_sub_groups  
  has_many :account_transactions
  has_many :account_transaction_items  
  has_many :account_group_types
  has_many :account_balances 

  has_many :inventory_unit_of_measurements
  has_many :inventory_groups
  has_many :inventory_items

  has_many :receipt_voucher_entries

  belongs_to :company
  belongs_to :default_current_open_day, :class_name => 'AccountingDay', :conditions => "state = 'Open'"

  validates_presence_of :name, :company_id

  after_create :setup_db_for_branch

  def current_accounting_period(todays_date = Date.today)
    accounting_periods.first(:conditions => "'#{todays_date.to_s(:db)}' between start_date and end_date")  
  end

  protected
  
  def setup_db_for_branch
    account_settings = {'Assets' => {'Loans And Advances' => [],
                                      'Miscellaneous Expenditure And losses' => [],
                                      'Profit And Loss Account' => [],
                                      'Investments' => [],
                                      'Current Assets' => ['Bank Accounts',
                                                           'Cash-in Hand',
                                                           'Stock-in Hand',
                                                           'Deposits',
                                                           'Sundry Debtors'
                                                          ]                                     
                                     },
                         'Liabilities' => {'Share Capital' => [],
                                           'Reserves And Surplus' => [],
                                           'Loans' => ['Secured Loans','Unsecured Loans'],
                                           'Current Liabilities' => []                                           
                                          },
                         'Expense' => {'Direct Expenses' => [],
                                       'Indirect Expenses' => [],
                                       'Purchases Account' => []
                                      },
                         'Income' => {'Direct Income' => [],
                                      'Indirect Income' => [],
                                      'Sales Account' => []                                     
                                     }
                        }
  
    account_settings.each_pair do |account_group_type_name, account_main_group_hash|
      account_group_type = AccountGroupType.new(:name => account_group_type_name)
      account_group_type.branch_id = self.id
      account_group_type.save!
      account_main_group_hash.each_pair do |account_main_group_name, account_sub_group_arr|
        account_main_group = AccountMainGroup.new(:name => account_main_group_name)
        account_main_group.branch_id = self.id
        account_main_group.account_group_type_id = account_group_type.id
        account_main_group.save!        
        account_sub_group_arr.each do |account_sub_group_name|
          account_sub_group = AccountSubGroup.new(:name => account_sub_group_name)
          account_sub_group.branch_id = self.id
          account_sub_group.parent_id = account_main_group.id
          account_sub_group.account_group_type_id = account_group_type.id
          account_sub_group.save!
        end
      end      
    end 
    AccountingPeriod.set_up_accounting_period(self)
  end
end
