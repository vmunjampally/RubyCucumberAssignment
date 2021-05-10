Feature: Gomo Buy a SIM Page check

  @Optus_shop
  Scenario Outline: Buy a SIM page for component validation
    Given I load "https://www.optus.com.au/" in the browser
    When Optus home page is loaded in the browser
    Then I click on "Shop" button
    And I click on "Latest Phones" from dropdown

    And I landed on Shop page
    And I clicked on the "All Brands" dropdown
    And I select brand name for filter
    And I clicked on the "All Internal Memory" dropdown
    And I select memory for filter
    And I clicked on the "All Network Speed" dropdown
    And I select internet speed for filter
    And I clicked on the "All Payment Terms" dropdown
    And I select payment terms for filter
    And I clicked on the "All Sort" dropdown
    And I sort by "<Sort_by>"
    Examples:
      |Sort_by  |
      | High    |
      | Low     |

  @Optus_shop_purchase
  Scenario: Gomo Buy a SIM page for component validation
    Given I load "https://www.optus.com.au/" in the browser
    When Optus home page is loaded in the browser
    Then I click on "Shop" button

    And I click on "Data SIMs" from dropdown
    And I landed on Data Sim page
    And I click on "BUY NOW" button in Datasim page
    And I am selecting "I'm new to Optus radio button" from radio button
    And I am selecting "Proceed to checkout as a new customer" from selection
    And User click on "Proceed to Cart" button
    And I click on "CHECKOUT" in checkout page
    And I pass the value for "emailAddress" as "shoptest1@yopmail.com"
    And I pass the value for "emailAddressConfirmation" as "shoptest1@yopmail.com"
    And I click on "Continue" in checkout page
    And I pass the value for "primaryContactNumber" as "0400000000"
    And I pass the value for "firstName" as "Shop"
    And I pass the value for "lastName" as "Test"
    And I pass the value for "dobYear" as "2000"
    And I select the value for "dobDay" as "22"
    And I select the value for "dobMonth" as "Jan"
    And I select the value for "title" as "Mr"
    And I pass the value for "dobYear" as "2000"
    And I click on "Next" in checkout page
    And I pass the value for "addressAutoInput-uxPrimaryAddressDetails" as "1-7 lyonpark"
    And I select value from dropdown
    And I select the value for "residentialStatus" as "Renting"
    And I select the value for "yearLivedAtAddress" as "3"
    And I select the value for "monthLivedAtAddress" as "10"
    And I select next button
#    And I landed on occupation details page
    And I wait for "Your Occupation details" from header to appear
    And I select the value for "occupation" as "Unemployed"
    And I select next button in "occupation" page
    And I am selecting "Australian driver's licence" from selection
    And I select the value for "stateOfIssue" as "NSW"
    And I pass the value for "driversLicenseNumber" as "11111111"
    And I select the value for "expiryMonth" as "May"
    And I select the value for "expiryYear" as "2025"
    And I check the identification document checkbox
    And I select next button in "identification document" page
    And I wait for "Delivery Details" from header to appear
#    And I select next button in "identification document" page
#    And I select next button in "shipping address" page
#    And I select next button in "Billing address" page
#    And I am selecting "No direct debit - Make manual payments" from selection
#    And I select next button in "Manual Payment" page
#    And I am in the confirm order page

  @Optus_shop_purchase_2
  Scenario: Gomo Buy a SIM page for component validation
    Given I load "https://www.optus.com.au/" in the browser
    When Optus home page is loaded in the browser
    Then I click on "Shop" button

    And I click on "iPads & Tablets" from dropdown
    And I am selecting "Select Device iPad (8th gen)" tablet from selection
    And I landed on purchase page
    And I select plan from Device
    And I am selecting "I'm new to Optus radio button" from radio button
    And I am selecting "Proceed to checkout as a new customer" from selection
    And User click on "Proceed to Cart" button