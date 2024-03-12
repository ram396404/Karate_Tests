Feature:Automation test for POST

  Background:
    * url baseURL
    * def javaUtilss = Java.type('org.example.javautils.JavaUtils')

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

  @Create
  Scenario: Passing data using POST method for Test URL and validating Response code and JSON Response

    * def requestBody = read('file:src/test/resources/create/request.json')
    * def responseBody = read('file:src/test/resources/create/response.json')
    Given path 'posts'
    And header Content-Type = 'application/json; Accept-Charset=UTF-8'
    And request requestBody
    When method POST
    Then status 201
    And print response
    And match response == responseBody


  Scenario: Passing random values from Utility

    * def javaUtilss = Java.type('org.example.javautils.JavaUtils')
    * def randomUserID = getRandomDigit()
    * def req =
      """
     {
      "title": "foo",
      "body": "bar",
      "userId": "#randomUserID",
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


  @Create
  Scenario: Passing data from resources JSON file and updating JSON as needed

    * def requestBody = read('file:src/test/resources/create/request.json')
    * def responseBody = read('file:src/test/resources/create/response.json')
    Given path 'posts'
    And header Content-Type = 'application/json; Accept-Charset=UTF-8'
    And request requestBody
    And print requestBody
    * set requestBody.newKey = "First New Value"
    And print requestBody
    * remove requestBody.newKey
    And print requestBody
    When method POST
    Then status 201
    And print response
    And match response == responseBody

