  @Full
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

  @CreateUsingFile
  Scenario: Passing data using POST method for Test URL and validating Response code and JSON Response

    * def requestBody = read('file:src/test/resources/create/request.json')
    * def responseBody = read('file:src/test/resources/create/response.json')
    Given path 'posts'
    And header Content-Type = 'application/json; Accept-Charset=UTF-8'
    And request requestBody
    And print requestBody
    When method POST
    Then status 201
    And print response
    And match response == responseBody

  @CreateUsingRandomvalue
  Scenario: Passing random values from Utility

    * def javaUtils = Java.type('org.example.utils.JavaUtils')
    * def randomUserID = javaUtils.getRandomDigit()
    * print randomUserID
    * def req =
"""
   {
      "title": "foo",
      "body": "bar",
      "userId": "#(1*randomUserID)",
   }
"""
    * def res =
"""
   {
      "title": "foo",
      "body": "bar",
      "userId": "#(1*randomUserID)",
      "id": 101
   }
"""
    Given path 'posts'
    And header Content-Type = 'application/json; Accept-Charset=UTF-8'
    And request req
    And print req
    When method POST
    Then status 201
    And print response
    * set response.userId = req.userId
    And print response
    And match response == res


  @CreateUpdatingJSON
  Scenario: Passing data from resources JSON file and updating JSON as needed

    * def requestBody =
"""
   {
      "title": "foo",
      "body": "bar",
      "userId": 1,
      "newKey": "New Value"
   }
"""
    * def responseBody =
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

