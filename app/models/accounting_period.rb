class AccountingPeriod < ActiveRecord::Base
  include AASM
  has_many :transactions
  has_many :account_balances
  has_many :account_days
  belongs_to :company
  belongs_to :branch
    
  validates_presence_of :name, :branch_id
  validates_uniqueness_of :name, :scope => :branch_id  
  validate :overlapping_periods
  
  attr_accessible :name, :start_date, :end_date
    
  aasm_column :state
  aasm_initial_state :Open
  aasm_state :Open
  aasm_state :Closed  
  
  aasm_event :close do
    transitions :to => :Closed, :from => [:Open]
  end
    
  def self.set_up_accounting_period(branch, date_for=Date.today)
    accounting_start_year = (date_for.month > 3 ? date_for.year : (date_for.year - 1))
    accounting_end_year = (date_for.month > 3 ? (date_for.year + 1) : date_for.year)
    accounting_start_date = Date.new(accounting_start_year, 4, 1)
    accounting_end_date = Date.new(accounting_end_year, 3, 31)    
    name = "#{accounting_start_year}-#{accounting_end_year}"
    acct_period = AccountingPeriod.new(:name => name, :start_date => accounting_start_date, :end_date => accounting_end_date)
    acct_period.branch_id = branch.id
    acct_period.save! if acct_period.valid?    
  end
  
  def self.current_accounting_period(branch, todays_date = Date.today)
    return first(:conditions => ["'#{todays_date.to_s(:db)}' between start_date and end_date and branch_id = ?", branch.id])
  end
  
  protected
  
  def overlapping_periods
    start_date_overlap = AccountingPeriod.find(:first, :conditions => "'#{start_date.to_s(:db)}' between start_date and end_date and branch_id = #{branch_id}")
    errors.add(:start_date, 'overlaps an existing period') unless start_date_overlap.blank?
    end_date_overlap = AccountingPeriod.find(:first, :conditions => "'#{end_date.to_s(:db)}' between start_date and end_date and branch_id = #{branch_id}")    
    errors.add(:end_date, 'overlaps an existing period') unless end_date_overlap.blank?
    errors.empty?
  end
end
