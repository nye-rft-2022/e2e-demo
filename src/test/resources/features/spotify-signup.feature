Feature: Spotify sign up page

  Background:
    Given the home page is opened
    And the Cookie disclaimer is closed
    And the Registration header button is clicked

  Scenario: Check required fields
    Given it is scrolled down
    When the Registration button is clicked
    Then the 'This email is invalid. Make sure it’s written like example@email.com' error message of the 'Email address' field should be shown

  Scenario Outline: Check the fields with invalid parameters
    When the '<field>' is filled in with '<parameter>'
    And the Tab button is pressed
    Then the '<errorMessage>' error message of the '<field>' field should be shown  

    Examples:
      | field             | parameter | errorMessage                                                         |
      | Email address     | asd       | This email is invalid. Make sure it’s written like example@email.com |
      | Email address     | 123       | This email is invalid. Make sure it’s written like example@email.com |

  Scenario: Check email field with valid, but already existing email
    When the 'Email address' is filled in with 'spotifytest@asd.com'
    And the Tab button is pressed
    Then the 'This address is already linked to an existing account. To continue, ' error message of the 'Email addresss' field should be shown at banner