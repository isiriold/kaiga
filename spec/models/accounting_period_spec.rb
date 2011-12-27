require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AccountingPeriod do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :start_date => Time.now,
      :end_date => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    AccountingPeriod.create!(@valid_attributes)
  end
  
  describe 'overlapping range validation' do
    before(:each) do  
      AccountingPeriod.create!(:name => "value for name", :start_date => (Date.today - 10), :end_date => (Date.today + 10))
    end
        
    it "should not have periods with overlapping ranges - scenario 1" do    
      period_0 = AccountingPeriod.new(:name => "value for name - 1", :start_date => (Date.today - 10), :end_date => (Date.today + 10))       
      period_0.should be_invalid
    end
      
    it "should not have periods with overlapping ranges - scenario 2" do    
      period_1 = AccountingPeriod.new(:name => "value for name - 1", :start_date => (Date.today - 5), :end_date => (Date.today + 5))       
      period_1.should be_invalid
    end  
    
    it "should not have periods with overlapping ranges - scenario 3" do    
      period_1 = AccountingPeriod.new(:name => "value for name - 1", :start_date => (Date.today - 5), :end_date => (Date.today + 15))       
      period_1.should be_invalid
    end  
    
    it "should not have periods with overlapping ranges - scenario 4" do    
      period_3 = AccountingPeriod.new(:name => "value for name - 1", :start_date => (Date.today - 15), :end_date => (Date.today + 5))       
      period_3.should be_invalid
    end
      
    it "should not have periods with overlapping ranges - scenario 5" do    
      period_4 = AccountingPeriod.new(:name => "value for name - 1", :start_date => (Date.today - 10), :end_date => (Date.today + 15))       
      period_4.should be_invalid
    end  
    
    it "should not have periods with overlapping ranges - scenario 6" do    
      period_5 = AccountingPeriod.new(:name => "value for name - 1", :start_date => (Date.today - 15), :end_date => (Date.today + 10))       
      period_5.should be_invalid
    end  

    it "should be valid when periods are not within overlapping ranges" do
      period_5 = AccountingPeriod.new(:name => "value for name - 1", :start_date => (Date.today + 11), :end_date => (Date.today + 21))       
      period_5.should be_valid
    end
    
    after(:each) do
      AccountingPeriod.destroy_all
    end    
  end  
  
  describe :set_up_accounting_period do
    
    it "should setup the accounting period for current year if its not already present" do    
      AccountingPeriod.set_up_accounting_period
      acct_period = AccountingPeriod.find(:first)
      acct_period.start_date.month.should == 4
      acct_period.start_date.day.should == 1 
      acct_period.start_date.year.should == (Date.today.month > 3 ? Date.today.year : (Date.today.year - 1))
      
      acct_period.end_date.month.should == 3
      acct_period.end_date.day.should == 31
      acct_period.end_date.year.should == (Date.today.month > 3 ? (Date.today.year + 1) : Date.today.year)
    end
  
  end
  
  describe :current_accounting_period do
  
    it "should return the accounting period for the current date" do
      AccountingPeriod.set_up_accounting_period
      current_acct_period = AccountingPeriod.current_accounting_period
      acct_period = AccountingPeriod.find(:first)
      current_acct_period.should == acct_period
    end
   
  end  
  
  after(:each) do
    AccountingPeriod.destroy_all
  end
end
