Feature:Automation test for End to End scenarios

  Background:
    * url baseURL

  Scenario: Create, GET, Delete - In One Feature File

    * def result = call read('file:/Users/396404/IdeaProjects/Karate_Practice_Tests/src/test/java/Karate_test/Create1.feature')
    * def result = call read('file:/Users/396404/IdeaProjects/Karate_Practice_Tests/src/test/java/Karate_test/Get_Practice.feature')
    * def result = call read('file:/Users/396404/IdeaProjects/Karate_Practice_Tests/src/test/java/Karate_test/Delete.feature')