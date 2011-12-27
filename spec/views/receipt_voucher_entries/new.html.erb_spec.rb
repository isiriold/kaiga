require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/receipt_voucher_entries/new" do
  before(:each) do
    render 'receipt_voucher_entries/new'
  end
  
  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('p', %r[Find me in app/views/receipt_voucher_entries/new])
  end
end
