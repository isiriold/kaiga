require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/account_main_groups/index.html.erb" do
  include AccountMainGroupsHelper
  
  before(:each) do
    assigns[:account_main_groups] = [
      stub_model(AccountMainGroup,
        :name => "value for name",
        :description => "value for description",
        :is_p_and_l_acct => false,
        :account_group_type_id => 1
      ),
      stub_model(AccountMainGroup,
        :name => "value for name",
        :description => "value for description",
        :is_p_and_l_acct => false,
        :account_group_type_id => 1
      )
    ]
  end

  it "renders a list of account_main_groups" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

