class AccountingPeriodsController < ApplicationController
  # GET /accounting_periods
  # GET /accounting_periods.xml
  def index
    @accounting_periods = user_default_branch.accounting_periods.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @accounting_periods }
    end
  end

  # GET /accounting_periods/1
  # GET /accounting_periods/1.xml
  def show
    @accounting_period = user_default_branch.accounting_periods.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @accounting_period }
    end
  end

  # GET /accounting_periods/new
  # GET /accounting_periods/new.xml
  def new
    @accounting_period = user_default_branch.accounting_periods.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @accounting_period }
    end
  end

  # GET /accounting_periods/1/edit
  def edit
    @accounting_period = user_default_branch.accounting_periods.find(params[:id])
  end

  # POST /accounting_periods
  # POST /accounting_periods.xml
  def create
    @accounting_period = user_default_branch.accounting_periods.build(params[:accounting_period])

    respond_to do |format|
      if @accounting_period.save
        flash[:notice] = 'AccountingPeriod was successfully created.'
        format.html { redirect_to(@accounting_period) }
        format.xml  { render :xml => @accounting_period, :status => :created, :location => @accounting_period }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @accounting_period.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /accounting_periods/1
  # PUT /accounting_periods/1.xml
  def update
    @accounting_period = user_default_branch.accounting_periods.find(params[:id])

    respond_to do |format|
      if @accounting_period.update_attributes(params[:accounting_period])
        flash[:notice] = 'AccountingPeriod was successfully updated.'
        format.html { redirect_to(@accounting_period) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @accounting_period.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /accounting_periods/1
  # DELETE /accounting_periods/1.xml
  def destroy
    @accounting_period = user_default_branch.accounting_periods.find(params[:id])
    @accounting_period.destroy

    respond_to do |format|
      format.html { redirect_to(accounting_periods_url) }
      format.xml  { head :ok }
    end
  end
end
