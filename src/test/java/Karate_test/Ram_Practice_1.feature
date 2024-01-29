Feature:Automation test for GET

Background:
  * url commentsbaseURL
  * url baseURL

  Scenario: Parameterized URL test for comments
    * def query = {postId: 1}
    Given url commentsbaseURL
    And params query
    When method GET
    Then status 200
    And match karate.toString(response) contains "postId"
    And match karate.toString(response) contains "id"
    And match karate.toString(response) contains "name"
    And match karate.toString(response) contains "email"
    And match karate.toString(response) contains "body"
    * def jsonResponse = response
    * print 'name---' + jsonResponse[1].name
    * print 'name---' + jsonResponse[0].name
    * def userCount = jsonResponse.length
    * print userCount
    * match userCount == 5
    * match jsonResponse[1] contains {postId:1, id:2, name:'quo vero reiciendis velit similique earum'}
    * match jsonResponse[4] contains {postId:1, id:5, email:'Hayden@althea.biz'}
    * match jsonResponse[0] contains {postId:1,  email:'Eliseo@gardner.biz', body:'laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium'}


  Scenario: Parameterized URL test for comments
    Given url baseURL
    And path 'posts/1/comments'
    When method GET
    Then status 200
    And match karate.toString(response) contains "postId"
    And match karate.toString(response) contains "id"
    And match karate.toString(response) contains "name"
    And match karate.toString(response) contains "email"
    And match karate.toString(response) contains "body"
    * def jsonResponse = response
    * print 'name---' + jsonResponse[1].name
    * print 'name---' + jsonResponse[0].name
    * def userCount = jsonResponse.length
    * print userCount
    * match userCount == 5
    * match jsonResponse[1] contains {postId:1, id:2, name:'quo vero reiciendis velit similique earum'}
    * match jsonResponse[3] contains {postId:1, id:4, email:'Lew@alysha.tv'}


  Scenario: Get the contents from POSTS
    Given url baseURL
    And path 'posts'
    When method GET
    Then status 200

  Scenario: Get the contents from comments
    Given url baseURL
    And path 'comments'
    When method GET
    Then status 200

  Scenario: Get the contents from albums
    Given url baseURL
    And path 'albums'
    When method GET
    Then status 200

  Scenario: Get the contents from photos
    Given url baseURL
    And path 'photos'
    When method GET
    Then status 200

  Scenario: Get the contents from todos
    Given url baseURL
    And path 'todos'
    When method GET
    Then status 200

  Scenario: Get the contents from users
    Given url baseURL
    And path 'users'
    When method GET
    Then status 200

  Scenario: Get the contents from POSTS/1
    Given url baseURL
    And path 'posts/1'
    When method GET
    Then status 200

  Scenario: Get the contents from POSTS/1/comments
    Given url baseURL
    And path '/posts/1/comments'
    When method GET
    Then status 200


  Scenario: Get the contents from POSTS/1/comments?postId=1
    Given url baseURL
    And path 'posts/1/comments?postId=1'
    When method GET
    Then status 200


  Scenario: PUT the contents from POSTS/1
    Given url baseURL
    And path 'posts/1'
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
    Given url baseURL
    And path 'posts/1'
    When method GET
    Then status 200

  Scenario: PATCH the contents from POSTS/1
    Given url baseURL
    And path 'posts/1'
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
    Given url baseURL
    And path 'posts/1'
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