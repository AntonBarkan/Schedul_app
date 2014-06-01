Feature: Login
  Scenario: Successful login
    Given the following user records
      | name     |email            | password |  password_confirmation|
      | antonl    |anton@gmail.com | secret |       secret            |
      | bob       |bob@mail.com    | 123321 | 123321                  |
    Given I on the signin page
    Given I fill in "session_email" with "anton@gmail.com"
    Given I fill in "session_password" with "secret"
    When I press "Log in"
    Then I should see "Welcome antonl"
    Given I on the signin page
    Given I fill in "session_email" with "bob@gmail.com"
    Given I fill in "session_password" with "123321"
    When I press "Log in"
    Then I should see "Invalid email/password"

  Scenario:Successful user registration
    Given I on the signup page
    Given I fill in "user_name" with "Aslak"
    Given I fill in "user_email" with "afaf@agga.com"
    Given I fill in "user_password" with "1234321"
    Given I fill in "user_password_confirmation" with "1234321"
    When I press "Create my account"
    Then I should see "Welcome Aslak"

  Scenario: Not successful user registration wrong email
    Given I on the signup page
    Given I fill in "user_name" with "Aslak"
    Given I fill in "user_email" with "afafagga.com"
    Given I fill in "user_password" with "1234321"
    Given I fill in "user_password_confirmation" with "1234321"
    When I press "Create my account"
    Then I should see "Email is invalid"

  Scenario: Not successful user registration wrong password confirmation
    Given I on the signup page
    Given I fill in "user_name" with "Aslak"
    Given I fill in "user_email" with "afafagga.com"
    Given I fill in "user_password" with "1234321"
    Given I fill in "user_password_confirmation" with "123421"
    When I press "Create my account"
    Then I should see "Password confirmation doesn't match Password"

  Scenario: Not successful user registration short password
    Given I on the signup page
    Given I fill in "user_name" with "Aslak"
    Given I fill in "user_email" with "afafagga.com"
    Given I fill in "user_password" with "123"
    Given I fill in "user_password_confirmation" with "123"
    When I press "Create my account"
    Then I should see "Password is too short"

  Scenario:routing
    Given I on the signin page
    When I press "Sign up now!"
    Then I should be on the signup page