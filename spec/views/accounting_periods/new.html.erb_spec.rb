require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/accounting_periods/new.html.erb" do
  include AccountingPeriodsHelper
  
  before(:each) do
    assigns[:accounting_period] = stub_model(AccountingPeriod,
      :new_record? => true,
      :name => "value for name"
    )
  end

  it "renders new accounting_period form" do
    render
    
    response.should have_tag("form[action=?][method=post]", accounting_periods_path) do
      with_tag("input#accounting_period_name[name=?]", "accounting_period[name]")
    end
  end
end


