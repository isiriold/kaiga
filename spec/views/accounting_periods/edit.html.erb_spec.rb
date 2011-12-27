require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/accounting_periods/edit.html.erb" do
  include AccountingPeriodsHelper
  
  before(:each) do
    assigns[:accounting_period] = @accounting_period = stub_model(AccountingPeriod,
      :new_record? => false,
      :name => "value for name"
    )
  end

  it "renders the edit accounting_period form" do
    render
    
    response.should have_tag("form[action=#{accounting_period_path(@accounting_period)}][method=post]") do
      with_tag('input#accounting_period_name[name=?]', "accounting_period[name]")
    end
  end
end


