require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/account_main_groups/show.html.erb" do
  include AccountMainGroupsHelper
  before(:each) do
    assigns[:account_main_group] = @account_main_group = stub_model(AccountMainGroup,
      :name => "value for name",
      :description => "value for description",
      :is_p_and_l_acct => false,
      :account_group_type_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(/false/)
    response.should have_text(/1/)
  end
end

