Feature: Spotify sign up page

  Background:
    Given the home page is opened
      And the Cookie disclaimer is closed
      And the Regisztráció header button is clicked

  Scenario: Check required fields
    Given it is scrolled down
    When the Regisztráció button is clicked
    Then the 'Add meg az e-mail-címedet.' error message of the 'Add meg az e-mail címed.' field should be shown
      And the 'Erősítsd meg az e-mail-címed.' error message of the 'Írd be újra az e-mail-címed.' field should be shown
      And the 'Meg kell adnod a jelszavadat.' error message of the 'Adj meg egy jelszót.' field should be shown
      And the 'Add meg a profilod nevét.' error message of the 'Válassz profilnevet.' field should be shown
      And the 'Válaszd ki a születési hónapod.' error message of the 'Hónap' field should be shown
      And the 'Érvényes formátumban add meg a napot.' error message of the 'NN' dropdown should be shown
      And the 'Érvényes formátumban add meg az évet.' error message of the 'ÉÉÉÉ' dropdown should be shown
      And the 'Válaszd ki a nemed.' error message of the 'Férfi, Nő, Nem bináris' radio buttons should be shown
      And the 'A folytatáshoz el kell fogadnod az Általános szerződési feltételeket.' error message of the 'privacy policy' checkbox should be shown
      And the 'Erősítsd meg, hogy nem vagy robot.' error message of the 'captcha' field should be shown

  Scenario Outline: Check the fields with invalid parameters
    When the '<field>' is filled in with '<parameter>'
      And the Tab button is pressed
    Then the '<errorMessage>' error message of the '<field>' field should be shown

    Examples:
      | field                    | parameter | errorMessage                                                           |
      | Add meg az e-mail címed. | asd       | Érvénytelen e-mail-cím. Érvényes e-mail-cím formátuma: pelda@email.com |
      | Add meg az e-mail címed. | 123       | Érvénytelen e-mail-cím. Érvényes e-mail-cím formátuma: pelda@email.com |
      | Adj meg egy jelszót.     | aaa       | A jelszavad túl rövid.                                                 |

  Scenario: Check email field with valid, but already existing email
    When the 'Add meg az e-mail címed.' is filled in with 'spotifytest@asd.com'
      And the Tab button is pressed
    Then the 'Ezt az e-mail-címet már egy másik fiók használja. ' error message of the 'Add meg az e-mail címed.' field should be shown

  Scenario: Fill email fields with valid but not equal values
    When the 'Add meg az e-mail címed.' is filled in with 'teszt_elek@epam.com'
      And the 'Írd be újra az e-mail-címed.' is filled in with 'teszt_anna@epam.com'
      And the Tab button is pressed
    Then the 'A két e-mail-cím nem egyezik.' error message of the 'Írd be újra az e-mail-címed.' field should be shown
