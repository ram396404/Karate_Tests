Feature:Automation test for POST

  Background:
    * url baseURL

  @Create
  Scenario: Passing data using POST method for Test URL and validating Response code and JSON Response

    * def requestBody = read('file:/Users/396404/IdeaProjects/Karate_Practice_Tests/src/test/resources/create/request.json')
    * def responseBody = read('file:/Users/396404/IdeaProjects/Karate_Practice_Tests/src/test/resources/create/response.json')
    Given path 'posts'
    And header Content-Type = 'application/json; Accept-Charset=UTF-8'
    And request requestBody
    When method POST
    Then status 201
    And print response
    And match response == responseBody