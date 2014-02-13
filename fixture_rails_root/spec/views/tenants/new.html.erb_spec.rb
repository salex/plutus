require 'spec_helper'

describe "tenants/new" do
  before(:each) do
    assign(:tenant, stub_model(Tenant,
      :name => "MyString",
      :subdomain => "MyString"
    ).as_new_record)
  end

  it "renders new tenant form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tenants_path, "post" do
      assert_select "input#tenant_name[name=?]", "tenant[name]"
      assert_select "input#tenant_subdomain[name=?]", "tenant[subdomain]"
    end
  end
end
