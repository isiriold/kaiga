class Account < ActiveRecord::Base    
  belongs_to :account_group   
  belongs_to :branch  
  has_many :account_balances
  has_many :account_transaction_items
  has_many :account_transactions, :through => :account_transaction_items
  
  validates_presence_of :account_group, :name, :branch_id, :account_balances
  validates_numericality_of :current_balance
  validate :current_balance_as_positive  

  before_validation_on_create :set_account_balances_columns

  accepts_nested_attributes_for :account_balances
    
  attr_accessible :name, :account_balances_attributes
  
  protected
  def current_balance_as_positive
    errors.add(:current_balance, "cannot be less than zero") if !current_balance.blank? and current_balance < 0
  end

  def set_account_balances_columns
    account_balances.each do |account_balance|
      account_balance.accounting_period = AccountingPeriod.current_accounting_period(branch, account_balance.for_date)
      account_balance.branch = branch
      account_balance.accounting_day_id = branch.default_current_open_day_id
      account_balance.closing_balance = account_balance.opening_balance
    end
  end
end
