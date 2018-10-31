
Then /^set username to (.+) on user id portal$/ do |usr|
  page = UserIdPortal.page
  page.username.safe_wait_until_present(timeout: 3)
  if page.username.present?
    expect(page.username).to be_present
    page.username.set usr
  end
end

Then /^set password to (.+) on user id portal$/ do |pw|
  page = UserIdPortal.page
  if page.password.present?
    expect(page.password).to be_present
    page.password.set pw
  end
end

Then /^click login button on user id portal$/ do
  page = UserIdPortal.page
  if page.password.present?
    expect(page.login).to be_present
    page.login.click
    page.login.safe_wait_while_present(timeout: 2)
    expect(page.login).to_not be_present
  end
end