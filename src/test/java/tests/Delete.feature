  @DeleteAll
Feature:Automation test for POST

  Background:
    * url baseURL

  @Delete
  Scenario: Test DELETE method for Test URL and validating Response code and JSON Response

    * def req =
      """
     {
      "title": "foo",
      "body": "bar",
      "userId": 1
     }
      """
    * def res =
      """
     {
     }
      """
    Given path 'posts/1'
    And header Content-Type = 'application/json; Accept-Charset=UTF-8'
    And request req
    When method DELETE
    Then status 200
    And print response
    And match response == res