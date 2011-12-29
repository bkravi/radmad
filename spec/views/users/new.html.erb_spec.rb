require 'spec_helper'

describe "users/new.html.erb" do
  before(:each) do
    assign(:user, stub_model(User,
      :username => "MyString",
      :crypted_password => "MyString",
      :password_salt => "MyString",
      :email => "MyString",
      :persistence_token => "MyString",
      :roles_mask => 1
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path, :method => "post" do
      assert_select "input#user_username", :name => "user[username]"
      assert_select "input#user_crypted_password", :name => "user[crypted_password]"
      assert_select "input#user_password_salt", :name => "user[password_salt]"
      assert_select "input#user_email", :name => "user[email]"
      assert_select "input#user_persistence_token", :name => "user[persistence_token]"
      assert_select "input#user_roles_mask", :name => "user[roles_mask]"
    end
  end
end
