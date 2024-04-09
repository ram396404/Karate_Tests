Feature: CSVRead

  Scenario Outline: Read data from CSV File
    Given def requestJSON = read ('file:src/test/resources/EmpData.json')
    And request requestJSON
    And print requestJSON

    Examples:
      | read ('file:src/test/resources/EmpData.csv') |

