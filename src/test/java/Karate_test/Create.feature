Feature:Automation test for POST

  Background:
    * url baseURL

  Scenario: Passing data POST method for Test URL and validating Response code and JSON Response

    * def response =
    """
    [
    {
    "title": "foo",
    "body": "bar",
    "userId": 1,
    "id": 101
    }
    ]
    """
    And path 'posts'
    And header Content-Type = 'application/json; Accept-Charset=UTF-8'
    And request '{"title": "foo","body": "bar","userId": 1}'
    When method POST
    Then status 201
    * print response
    * print <ExpectedResponse>
    * match response == <ExpectedResponse>