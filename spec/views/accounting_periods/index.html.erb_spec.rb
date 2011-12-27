require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/accounting_periods/index.html.erb" do
  include AccountingPeriodsHelper
  
  before(:each) do
    assigns[:accounting_periods] = [
      stub_model(AccountingPeriod,
        :name => "value for name"
      ),
      stub_model(AccountingPeriod,
        :name => "value for name"
      )
    ]
  end

  it "renders a list of accounting_periods" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
  end
end

