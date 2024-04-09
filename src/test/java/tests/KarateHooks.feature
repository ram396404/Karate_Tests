@Full
Feature:Karate Hooks Tests

  Background:
    * configure afterScenario =
    """
    function (){
    karate.log('AfterHook is executed and printing the Scenario Name here:', karate.scenario.name);
    }
    """
    * configure afterFeature =
    """
    function (){
    karate.log('Feature Name is printed at the end after all the Scenarios are executed:', karate.feature.name);
    }
    """



  Scenario: Print FirstName
    * print bHook


  Scenario: Print lastname
    * print bHook

