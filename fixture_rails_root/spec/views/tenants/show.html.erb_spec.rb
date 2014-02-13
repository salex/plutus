require 'spec_helper'

describe "tenants/show" do
  before(:each) do
    @tenant = assign(:tenant, stub_model(Tenant,
      :name => "Name",
      :subdomain => "Subdomain"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Subdomain/)
  end
end
