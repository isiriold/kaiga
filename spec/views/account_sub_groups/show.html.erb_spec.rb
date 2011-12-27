require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/account_sub_groups/show.html.erb" do
  include AccountSubGroupsHelper
  before(:each) do
    assigns[:account_sub_group] = @account_sub_group = stub_model(AccountSubGroup,
      :name => "value for name",
      :description => "value for description",
      :parent_id => 1,
      :account_main_group => stub_model(AccountMainGroup)
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(/1/)
  end
end

