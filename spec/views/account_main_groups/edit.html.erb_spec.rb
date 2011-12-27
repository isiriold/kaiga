require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/account_main_groups/edit.html.erb" do
  include AccountMainGroupsHelper
  
  before(:each) do
    assigns[:account_main_group] = @account_main_group = stub_model(AccountMainGroup,
      :new_record? => false,
      :name => "value for name",
      :description => "value for description",
      :is_p_and_l_acct => false,
      :account_group_type_id => 1
    )
  end

  it "renders the edit account_main_group form" do
    render
    
    response.should have_tag("form[action=#{account_main_group_path(@account_main_group)}][method=post]") do
      with_tag('input#account_main_group_name[name=?]', "account_main_group[name]")
      with_tag('textarea#account_main_group_description[name=?]', "account_main_group[description]")
      with_tag('input#account_main_group_is_p_and_l_acct[name=?]', "account_main_group[is_p_and_l_acct]")
      with_tag('select#account_main_group_account_group_type_id[name=?]', "account_main_group[account_group_type_id]")
    end
  end
end


