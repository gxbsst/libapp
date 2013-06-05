require 'spec_helper'
describe 'sessions/new.html.erb' do
  before :each do
    assign(:login, mock_model("LoginS").as_null_object.as_new_record)
    render
  end
  it "has login form" do
    expect(rendered).to have_selector('form#new_login_s')
  end

  it "has  email field" do
    expect(rendered).to have_selector('input#login_s_email')
  end

  it "has password field" do
    expect(rendered).to have_selector('input#login_s_password')
  end

  it "has  submit button" do
    expect(rendered).to have_selector('input[type="submit"]')
  end
end
