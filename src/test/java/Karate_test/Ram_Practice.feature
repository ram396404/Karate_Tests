Feature:Automation test for GET

  Background:
    * url baseURL


  Scenario: Parameterized URL test for comments
    And path 'posts/1'
    When method GET
    Then status 200
    * match response ==
    """
    {
    "userId": 1,
    "id": 1,
    "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
    }
    """

  Scenario: Parameterized URL test for comments with Post ID = 1 and ID = 3
    * def query = {postId: 1, id: 3}
    And path 'comments'
    And params query
    When method GET
    Then status 200
    * match response[0] contains {postId:1,  email:'Nikita@garfield.biz', body:'quia molestiae reprehenderit quasi aspernatur\naut expedita occaecati aliquam eveniet laudantium\nomnis quibusdam delectus saepe quia accusamus maiores nam est\ncum et ducimus et vero voluptates excepturi deleniti ratione'}


  Scenario: Parameterized URL test for comments with Post ID = 1
    * def query = {postId: 1}
    And path 'comments'
    And params query
    When method GET
    Then status 200
    * match response[1] contains {postId:1, id:2, name:'quo vero reiciendis velit similique earum'}
    * match response[4] contains {postId:1, id:5, email:'Hayden@althea.biz'}
    * match response[0] contains {postId:1,  email:'Eliseo@gardner.biz', body:'laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium'}


