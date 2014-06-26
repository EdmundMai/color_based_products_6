Feature: Account settings

	Scenario: Viewing my account settings without logging in
		When I visit my account settings
		Then I should be redirected to the sign in page

	Scenario: Viewing my account settings
		Given I am an authenticated customer
		When I visit my account settings
		Then I should see my account settings
		
	Scenario: Editing my email and password without logging in
		When I visit the users edit page
		Then I should be redirected to the sign in page

	Scenario: Editing my email and password
		Given I am an authenticated customer
		When I visit my account settings
		And I click "Edit Account"
		And I change my email and password
		And I press "Update"
		Then my account should be updated
		
	Scenario: Viewing my order history without logging in
		When I visit the orders index page
		Then I should be redirected to the sign in page
		
	Scenario: Viewing my order history
		Given I am an authenticated customer
		And existing past orders
		When I visit my account settings
		And I click "Order History"
		Then I should see a list of my past orders
		
	Scenario: Viewing an individual past order
		Given I am an authenticated customer
		And existing past orders
		When I visit my account settings
		And I click "Order History"
		And I click on my last past order
		Then I should see all of my order's information
		