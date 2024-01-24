Feature:Automation test for GET

  Background:
    * url 'https://jsonplaceholder.typicode.com'



  Scenario: Get the contents from POSTS

    Given url 'https://jsonplaceholder.typicode.com/posts'

    When method GET
    Then status 200

  Scenario: Get the contents from comments

    Given url 'https://jsonplaceholder.typicode.com/comments'

    When method GET
    Then status 200


  Scenario: Get the contents from albums

    Given url 'https://jsonplaceholder.typicode.com/albums'

    When method GET
    Then status 200

  Scenario: Get the contents from photos

    Given url 'https://jsonplaceholder.typicode.com/photos'

    When method GET
    Then status 200

  Scenario: Get the contents from todos

    Given url 'https://jsonplaceholder.typicode.com/todos'

    When method GET
    Then status 200

  Scenario: Get the contents from users

    Given url 'https://jsonplaceholder.typicode.com/users'

    When method GET
    Then status 200

  Scenario: Get the contents from POSTS/1

    Given url 'https://jsonplaceholder.typicode.com/posts/1'

    When method GET
    Then status 200

  Scenario: Get the contents from POSTS/1/comments

    Given url 'https://jsonplaceholder.typicode.com/posts/1/comments'

    When method GET
    Then status 200

  Scenario: Get the contents from POSTS/1/comments?postId=1

    Given url 'https://jsonplaceholder.typicode.com/posts/1/comments?postId=1'

    When method GET
    Then status 200


  Scenario: PUT the contents from POSTS/1

    Given url 'https://jsonplaceholder.typicode.com/posts/1'

    When method PUT

    * def testData =
    """
      {
  "userId": 1,
  "id": 1,
  "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
  "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto RAM"
      }
    """

    Then status 200

  Scenario: Get the contents from POSTS/1

    Given url 'http://jsonplaceholder.typicode.com/posts/1'

    When method GET
    Then status 200


  Scenario: PATCH the contents from POSTS/1

    Given url 'https://jsonplaceholder.typicode.com/posts/1'

    When method PATCH

    * def testData =
    """
      {
  "userId": 2,
  "id": 2,
  "title": "PATCH sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
  "body": "PATCH quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto RAM"
      }
    """

    Then status 200


  Scenario: DELETE the contents from POSTS/1

    Given url 'https://jsonplaceholder.typicode.com/posts/1'

    When method DELETE

    * def testData =
    """
      {
  "userId": 2,
  "id": 2,
  "title": "PATCH sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
  "body": "PATCH quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto RAM"
      }
    """

    Then status 200

  Scenario Outline: Parameterized URL test for posts
    Given url 'https://jsonplaceholder.typicode.com/posts/<URI>'
    When method GET
    Then status 200
    And match karate.toString(response) contains "userId"
    And match karate.toString(response) contains "id"
    And match karate.toString(response) contains "title"
    And match karate.toString(response) contains "body"

    Examples:
      | URI |
      |   1  |
      |   2  |
      |   3  |


  Scenario Outline: Parameterized URL test for comments
    Given url 'https://jsonplaceholder.typicode.com/comments?postId=<URI>'
    When method GET
    Then status 200
    And match karate.toString(response) contains "postId"
    And match karate.toString(response) contains "id"
    And match karate.toString(response) contains "name"
    And match karate.toString(response) contains "email"
    And match karate.toString(response) contains "body"

    Examples:
      | URI |
      |   1  |
      |   2  |
      |   3  |

  Scenario: Test for Env config
    Given path '/Posts'
    When method GET
    Then status 200