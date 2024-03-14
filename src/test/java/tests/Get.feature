  @Full
Feature:Automation test for GET

  Background:
    * url baseURL

    @GetforPostID1
  Scenario Outline: Parameterized URL test for comments with Post ID = 1 and ID = (1,2 and 3)
    * def response1 =
"""
 [
  {
    "postId": 1,
    "id": 1,
    "name": "id labore ex et quam laborum",
    "email": "Eliseo@gardner.biz",
    "body": "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"
  }
 ]
"""
    * def response2 =
"""
 [
  {
    "postId": 1,
    "id": 2,
    "name": "quo vero reiciendis velit similique earum",
    "email": "Jayne_Kuhic@sydney.com",
    "body": "est natus enim nihil est dolore omnis voluptatem numquam\net omnis occaecati quod ullam at\nvoluptatem error expedita pariatur\nnihil sint nostrum voluptatem reiciendis et"
  }
 ]
"""
    * def response3 =
"""
 [
  {
    "name": "odio adipisci rerum aut animi",
    "postId": 1,
    "id": 3,
    "email": "Nikita@garfield.biz",
    "body": "quia molestiae reprehenderit quasi aspernatur\naut expedita occaecati aliquam eveniet laudantium\nomnis quibusdam delectus saepe quia accusamus maiores nam est\ncum et ducimus et vero voluptates excepturi deleniti ratione"
  }
 ]
"""
    * def query = {postId: <postId>, id: <id>}
    And path 'comments'
    And params query
    When method GET
    Then status 200
    * print response
    * print <ExpectedResponse>
    * match response == <ExpectedResponse>

    Examples:
      | postId | id | ExpectedResponse |
      | 1      | 1  | response1        |
      | 1      | 2  | response2        |
      | 1      | 3  | response3        |


  @GetforPosts123
  Scenario Outline: Parameterized URL test for Posts with Posts = (1,2 and 3)
    * def response1 =
"""
  {
    "userId": 1,
    "id": 1,
    "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
  }
"""
    * def response2 =
"""
  {
    "userId": 1,
    "id": 2,
    "title": "qui est esse",
    "body": "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"
  }
"""
    * def response3 =
"""
  {
    "userId": 1,
    "id": 3,
    "title": "ea molestias quasi exercitationem repellat qui ipsa sit aut",
    "body": "et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut"
  }
"""
    Given path  'posts/<postnumber>'
    When method GET
    Then status 200
    * print response
    * print <ExpectedResponse>
    * match response == <ExpectedResponse>

    Examples:
      | postnumber | ExpectedResponse |
      | 1          | response1        |
      | 2          | response2        |
      | 3          | response3        |