Feature:Automation test for POST

  Background:
    * url baseURL

  Scenario: Passing data using POST method for Test URL and validating Response code and JSON Response

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
      "title": "foo",
      "body": "bar",
      "userId": 1,
      "id": 101
      }
      """
    Given path 'posts'
    And header Content-Type = 'application/json; Accept-Charset=UTF-8'
    And request req
    When method POST
    Then status 201
    And print response
    And match response == res
