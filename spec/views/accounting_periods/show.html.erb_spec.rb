require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/accounting_periods/show.html.erb" do
  include AccountingPeriodsHelper
  before(:each) do
    assigns[:accounting_period] = @accounting_period = stub_model(AccountingPeriod,
      :name => "value for name"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
  end
end

