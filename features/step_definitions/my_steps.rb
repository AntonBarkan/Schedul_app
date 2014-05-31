Given /a user with email "(.*)" and with password "(.*)"/ do |arg1, arg2|
	@user = arg1
  @password = arg2
end

Given /I am on the signin page/ do
	visit '/signin'
end

Given /I fill in "(.*)" with "(.*)"/ do |arg1, arg2|
  fill_in arg1, with: arg2

end

When /I press "(.*?)"/ do |arg1|
  save_and_open_page
  page.find(:link_or_button, arg1).click
end

Then /I should see "(.*?)"/ do |arg1|
	page.should have_content(arg1)
end
