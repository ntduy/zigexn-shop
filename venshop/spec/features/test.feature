Feature: Attacking a monster
  Background:
    Given i visit "/" page

  Scenario: attack the monster
    When I click the first "add to cart"
    And I click "CART"
    And I fill "quantities_" with "2"
    And I click "Update Cart"
    Then I will get something like "$ 98"