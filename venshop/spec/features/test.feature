Feature: Test something
Background:
Given I visit "/" page
And I have this data
|Name	|	email		|	Phone			|	Password		|	Confirmation	|
|test	|	test@test	|	09121123456	|	123456789	|	123456789	|



Scenario: Checking quantities cart
When I click the first "add to cart"
And I click "CART"
And I fill "quantities_" with "2"
And I click "Update Cart"
Then I will get something like "$ 98"

Scenario: SignUp with wrong email
When I click "Sign Up"
And I fill "Name" with "test"
And I fill "Email" with "test@test"
And I fill "Phone" with "0123456789"
And I fill "Password" with "123456789"
And I fill "Confirmation" with "123456789"
And I click "Create my account"
Then I will not get something like "Please check your email"

Scenario: SignUp suscessfully
When I click "Sign Up"
And I fill "Name" with "test"
And I fill "Email" with "test@test.com"
And I fill "Phone" with "0123456789"
And I fill "Password" with "123456789"
And I fill "Confirmation" with "123456789"
And I click "Create my account"
Then I will get something like "Please check your email"

Scenario: Login unsuscessfully
When I click "Log in"
And I fill "Email" with "test@test.com"
And I fill "Password" with "somepass"
And I click button "Log in" "1" time
Then I will get something like "Invalid email/password combination"

Scenario: Login suscessfully
When I click "Log in"
And I fill "Email" with "admin@venshop.com"
And I fill "Password" with "123456"
And I click button "Log in" "1" time
Then I will get something like "Account"

Scenario: Checking out suscessfully
When I click the first "add to cart"
And I click "CART"
And I fill "Name" with "test"
And I fill "Email" with "admin@venshop.com"
And I fill "Address" with "some Address"
And I fill "Phone" with "0124566789"
And I click "checkout"
Then I will get something like "You will be recevie them soon! Check your mail to see cart's infomation"