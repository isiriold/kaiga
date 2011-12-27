require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/account_sub_groups/index.html.erb" do
  include AccountSubGroupsHelper
  
  before(:each) do
    assigns[:account_sub_groups] = [      
      stub_model(AccountSubGroup,
        :name => "value for name",
        :description => "value for description",
        :account_main_group => stub_model(AccountMainGroup,
                       :name => "value for account main group"         
                      )
      ),
      stub_model(AccountSubGroup,
        :name => "value for name",
        :description => "value for description",
        :account_main_group => stub_model(AccountMainGroup,
                       :name => "value for account main group"         
                      )
      )
    ]
  end

  it "renders a list of account_sub_groups" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for account main group", 2)
  end
end

