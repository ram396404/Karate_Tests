Feature: Env Test

  Background:
     * url 'https://jsonplaceholder.typicode.com'

  Scenario: Test for Env config
    Given path '/Posts'
    When method GET
    Then status 200