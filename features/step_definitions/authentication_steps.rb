Given /^a user visits the signin page$/ do
  visit signin_path
end

When /^he submits invalid signin information$/ do
  click_button I18n.t(:sign_in)
end

Then /^he should see an error message$/ do
  page.should have_selector('div.alert.alert-danger')
end

Given /^the user has an account$/ do
  @user = User.create(nik: "Example", pip: "Test Test Testovich",
                      password: "foobar", password_confirmation: "foobar")
end

When /^the user submits valid signin information$/ do
  fill_in :session_nik,    with: @user.nik
  fill_in :session_password, with: @user.password
  click_button I18n.t(:sign_in)
end

Then /^he should see his profile page$/ do
  page.should have_selector('title', text: @user.pip)
end

Then /^he should see a signout link$/ do
  page.should have_link(I18n.t(:sign_out), href: signout_path)
end