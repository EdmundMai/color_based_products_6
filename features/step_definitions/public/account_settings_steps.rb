When(/^I visit my account settings$/) do
  visit account_path
end

Then(/^I should see my account settings$/) do
  expect(page).to have_content("Account Settings")
  expect(page).to have_content("Edit Account")
  expect(page).to have_content("Order History")
end

Then(/^I should be redirected to the sign in page$/) do
  expect(current_path).to eq(new_user_session_path)
end

When(/^I change my email and password$/) do
  fill_in("user[email]", with: "mynewemail@email.com")
  fill_in("user[password]", with: "mynewpassword")
  fill_in("user[password_confirmation]", with: "mynewpassword")
  fill_in("user[current_password]", with: "test123")
end

Then(/^my account should be updated$/) do
  user = User.last
  expect(user.email).to eq("mynewemail@email.com")
end

Given(/^existing past orders$/) do
  user = User.last
  user.orders << FactoryGirl.create(:shipped_order, user: user)
end

Then(/^I should see a list of my past orders$/) do
  user = User.last
  expect(user.past_orders.count).to be > 0
  user.past_orders.each do |order|
    expect(page).to have_content(order.id)
    expect(page).to have_content(order.order_date.strftime("%m/%d/%Y"))
    expect(page).to have_content(order.total)
  end
end

When(/^I visit the users edit page$/) do
  visit edit_user_registration_path
end

When(/^I visit the orders index page$/) do
  visit account_orders_path
end

When(/^I click on my last past order$/) do
  user = User.last
  click_link(user.last_complete_order.id.to_s)
end

# When(/^I fill out the form to create a return$/) do
#   pending # express the regexp above with the code you wish you had
# end
#
# Then(/^I should see a summary of my return$/) do
#   pending # express the regexp above with the code you wish you had
# end
#
# Then(/^my return should be placed$/) do
#   pending # express the regexp above with the code you wish you had
# end
