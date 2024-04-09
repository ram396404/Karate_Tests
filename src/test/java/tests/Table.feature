@Full
Feature:Automation test for creating table and using it as JSON

  Background:

  Scenario: Creating a table and using it for building JSON

    * table employee
      | name      | job       | age | country   |
      |  'MZ'     | 'Auto'    | 16  | 'Poland'  |
      |  'KKH'    | 'Auto QA' | 19  | 'Main'    |
      |  'RK'     | 'Analyst' | 18  | 'US'      |
      |  'MB'     | 'Dev'     | 17  | 'India'   |

    * match employee == [{name: 'MZ', job: 'Auto', age: 16, country: 'Poland'}, {name: 'KKH', job: 'Auto QA', age: 19, country: 'Main'}, {name: 'RK', job: 'Analyst', age: 18, country: 'US'},{name: 'MB', job: 'Dev', age: 17, country: 'India'}]
    * print 'final employee\n', karate.pretty(employee)