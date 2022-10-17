Feature: Spotify sign up page

  Background:
    Given the home page is opened
    And the Cookie disclaimer is closed
    And the Regisztráció header button is clicked

  Scenario: Check required fields
    Given it is scrolled down
    When the Regisztráció button is clicked
    Then the 'You need to enter your email.' error message of the 'Add meg az e-mail címed.' field should be shown
    And the 'You need to confirm your email.' error message of the 'Írd be újra az e-mail-címed.' field should be shown
    And the 'You need to enter a password.' error message of the 'Adj meg egy jelszót.' field should be shown
    And the 'Enter a name for your profile.' error message of the 'Válassz profilnevet.' field should be shown
    And the 'Select your birth month.' error message of the 'Hónap' field should be shown
    And the 'Enter a valid day of the month.' error message of the 'NN' dropdown should be shown
    And the 'Enter a valid year.' error message of the 'ÉÉÉÉ' dropdown should be shown
    And the 'Select your gender.' error message of the 'Férfi, Nő, Nem bináris' radio buttons should be shown
    And the 'Please accept the terms and conditions to continue.' error message of the 'privacy policy' checkbox should be shown
    And the 'Confirm you're not a robot.' error message of the 'captcha' field should be shown

  Scenario Outline: Check the fields with invalid parameters
    When the '<field>' is filled in with '<parameter>'
    And the Tab button is pressed
    Then the '<errorMessage>' error message of the '<field>' field should be shown

    Examples:
      | field             | parameter | errorMessage                                                         |
      | Enter your email. | asd       | This email is invalid. Make sure it's written like example@email.com |
      | Enter your email. | 123       | This email is invalid. Make sure it's written like example@email.com |
      | Create a password.| aaa       | Your password is too short.                                          |

  Scenario: Check email field with valid, but already existing email
    When the 'Enter your email.' is filled in with 'spotifytest@asd.com'
    And the Tab button is pressed
    Then the 'This email is already connected to an account. ' error message of the 'Add meg az e-mail címed.' field should be shown

  Scenario: Fill email fields with valid but not equal values
    When the 'Enter your email.' is filled in with 'teszt_elek@epam.com'
    And the 'Enter your email again.' is filled in with 'teszt_anna@epam.com'
    And the Tab button is pressed
    Then the 'The email addresses don't match.' error message of the 'Írd be újra az e-mail-címed.' field should be shown
