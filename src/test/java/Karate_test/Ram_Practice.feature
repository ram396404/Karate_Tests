Feature:Automation test for GET

  Background:
    * url baseURL


  Scenario: Parameterized URL test for comments
    And path 'posts/1'
    When method GET
    Then status 200
    And match karate.toString(response) contains "userId"
    And match karate.toString(response) contains "id"
    And match karate.toString(response) contains "title"
    And match karate.toString(response) contains "body"
    * def jsonResponse = response
    * match jsonResponse contains {userId:1, id:1, title:'sunt aut facere repellat provident occaecati excepturi optio reprehenderit'}

  Scenario: Parameterized URL test for comments
    * def query = {postId: 1, id: 3}
    And path 'comments'
    And params query
    When method GET
    Then status 200
    * def jsonResponse = response
    * print 'name---' + jsonResponse[0].name
    * match jsonResponse[0] contains {postId:1,  email:'Nikita@garfield.biz', body:'quia molestiae reprehenderit quasi aspernatur\naut expedita occaecati aliquam eveniet laudantium\nomnis quibusdam delectus saepe quia accusamus maiores nam est\ncum et ducimus et vero voluptates excepturi deleniti ratione'}

  Scenario: Parameterized URL test for comments
    * def query = {postId: 1}
    And path 'comments'
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
