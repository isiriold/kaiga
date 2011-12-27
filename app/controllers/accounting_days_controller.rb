class AccountingDaysController < ApplicationController
  skip_before_filter :require_current_day, :only => [:new, :create]
  before_filter :require_no_current_day, :only => [:new, :create]

  def new
    @accounting_day = user_default_branch.accounting_days.build
  end

  def create
    @accounting_day = user_default_branch.accounting_days.build(params[:accounting_day])
    @accounting_day.save ? (redirect_to root_path) : (render :action => 'new')
  end

  def close
    a = current_day.close!
    redirect_to root_path
  end

  protected

  def require_no_current_day
    redirect_to root_path unless current_day.blank?
  end
end
