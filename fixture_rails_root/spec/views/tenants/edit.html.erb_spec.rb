require 'spec_helper'

describe "tenants/edit" do
  before(:each) do
    @tenant = assign(:tenant, stub_model(Tenant,
      :name => "MyString",
      :subdomain => "MyString"
    ))
  end

  it "renders the edit tenant form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tenant_path(@tenant), "post" do
      assert_select "input#tenant_name[name=?]", "tenant[name]"
      assert_select "input#tenant_subdomain[name=?]", "tenant[subdomain]"
    end
  end
end
