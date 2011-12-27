class AccountTransaction < ActiveRecord::Base
  belongs_to :accounting_period
  belongs_to :branch 
  has_many :account_transaction_items, :dependent => :destroy
  
  before_validation :set_accounting_period, :set_account_transaction_items_columns
  after_create :set_accounting_items_parent_id
  
  attr_accessible :transaction_no, :narrations, :account_transaction_items_attributes
  validates_presence_of :transaction_date, :accounting_period_id, :account_transaction_items
  validates_presence_of :branch_id
  validate :credit_and_debit_match
  validate :uniqueness_of_credit_or_debit
  validate :uniqueness_of_account_id
  
  accepts_nested_attributes_for :account_transaction_items, :reject_if => proc { |attributes| attributes['account_id'].blank? }
  
  protected
  
  def set_accounting_period
    accounting_period_for_transaction_date = AccountingPeriod.current_accounting_period(branch, transaction_date)
    write_attribute(:accounting_period_id, accounting_period_for_transaction_date.id) unless accounting_period_for_transaction_date.blank?
  end
  
  def set_account_transaction_items_columns
    account_transaction_items.each do |ati|
      ati.branch = branch
    end
  end
  
  def set_accounting_items_parent_id
    if account_transaction_items.length == 2
      account_transaction_items[0].update_attribute(:parent_id, account_transaction_items[1].id)
      account_transaction_items[1].update_attribute(:parent_id, account_transaction_items[0].id)      
    else
      max_amt = 0
      parent_id = -1
      account_transaction_items.each do |account_transaction_item|
        if account_transaction_item.amount > max_amt
          parent_id = account_transaction_item.id
          max_amt = account_transaction_item.amount        
        end        
      end
      account_transaction_items.each do |account_transaction_item|
        if account_transaction_item.id == parent_id
          account_transaction_item.update_attribute(:parent_id, -1)
        else
          account_transaction_item.update_attribute(:parent_id, parent_id)
        end  
      end
    end
  end
  
  def uniqueness_of_credit_or_debit
    debit_count, credit_count = 0, 0
    account_transaction_items.each do |ati|
      if ati.category == 'Debit'
        debit_count += 1
      else  
        credit_count += 1
      end  
    end
    errors.add('There can only be one credit or debit per transaction') unless (debit_count == 1 or credit_count == 1)
  end
  
  def credit_and_debit_match
    debit_sum, credit_sum = 0, 0    
    account_transaction_items.each do |ati|    
      next if ati.amount.blank?
      if ati.category == 'Debit'
        debit_sum += ati.amount
      else
        credit_sum += ati.amount
      end
    end
    errors.add('Credit and Debit amount does not match') if debit_sum != credit_sum
  end
  
  def uniqueness_of_account_id
    hash = {}
    account_transaction_items.each do |ati|
      hash[ati.account_id] = 1
    end
    account_transaction_items.each do |ati|
      hash[ati.account_id] += 1
    end
    errors.add('Only one account can be effected per transaction') if hash.any?{|a| a[1] > 2}
  end  
end
