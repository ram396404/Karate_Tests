Feature:Automation test for POST

  Background:
    * url baseURL

  Scenario: Passing data using POST method for Test URL and validating Response code and JSON Response

    And path 'posts'
    And header Content-Type = 'application/json; Accept-Charset=UTF-8'
    And request '{"title": "foo","body": "bar","userId": 1}'
    When method POST
    Then status 201
    * print response
    And match response == {"title": "foo","body": "bar","userId": 1,"id": 101}