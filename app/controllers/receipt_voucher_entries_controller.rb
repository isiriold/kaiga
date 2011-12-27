class ReceiptVoucherEntriesController < ApplicationController
  def new
    @cash_bank_accounts = user_default_branch.accounts.all(:joins => :account_group, :conditions => "account_groups.name in ('Cash-in Hand', 'Bank Accounts')")
    @all_accounts = user_default_branch.accounts.all(:joins => :account_group, :conditions => "account_groups.name not in ('Cash-in Hand', 'Bank Accounts')")
    @all_inventories = user_default_branch.inventory_items
    @receipt_voucher_entry = user_default_branch.receipt_voucher_entries.build
  end

  def create
    @receipt_voucher_entry = user_default_branch.receipt_voucher_entries.build(params[:receipt_voucher_entry])
    @receipt_voucher_entry.transaction_date = current_day.for_date
    if @receipt_voucher_entry.save
      redirect_to new_receipt_voucher_entry_path
    else
      @cash_bank_accounts = user_default_branch.accounts.all(:joins => :account_group, :conditions => "account_groups.name in ('Cash-in Hand', 'Bank Accounts')")
      @all_accounts = user_default_branch.accounts.all(:joins => :account_group, :conditions => "account_groups.name not in ('Cash-in Hand', 'Bank Accounts')")
      render :action => 'new'
    end
  end

end
