Given /^the following user records$/ do |table|
  table.hashes.each do |hash|
    User.create(hash).save
  end

end
Given /^I on the signin page$/ do
  visit '/signin'
end
Given /^I fill in "(.*?)" with "(.*?)"$/ do |arg1, arg2|
  element = page.find_by_id(arg1)
  element.set(arg2)
end
When /^I press "(.*?)"$/ do |arg1|
  click_on arg1
end
Then /^I should see "(.*?)"$/ do |arg1|
  page.should have_content(arg1)
end
Given /^I on the signup page$/ do
  visit '/signup'
end
Then /^I should be on the signup page$/ do
  current_path.should == '/signup'
end