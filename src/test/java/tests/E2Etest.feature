  @Full
Feature:Automation test for End to End scenarios

  Background:
    * url baseURL

  Scenario: Create, GET, Delete - In One Feature File

    * def result = call read('Create.feature@Full')
    * def result = call read('Get.feature@Full')
    * def result = call read('Delete.feature@Full')
