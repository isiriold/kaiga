class AccountGroupsController < ApplicationController

  def index
    @account_group_types = user_default_branch.account_group_types.find(:all, :include => :account_groups)
  end

  def new
    @account_group = user_default_branch.account_groups.build
    @income_main_groups = user_default_branch.account_group_types.find_by_name('Income').account_groups.all(:select => 'id, name')
  end

  def create
           
  end
end
