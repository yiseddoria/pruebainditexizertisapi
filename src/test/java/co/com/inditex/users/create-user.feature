Feature: PetStore Api
  As tester
  I want to create user and find pets
  To check the data of the users and pets

  Background:
    * url baseUrl = "https://petstore.swagger.io/v2"
    * header Content-Type = 'application/json'
    * def data = read("data/bodyRequest.json")
    * def newJson = read("function/generateNewJson.js")
    * def nameDuplicate = read("function/findNameDuplicate.js")

  @createAndFindUser
  Scenario: Create new user and find user created
    Given path "/user"
    And request data
    When method POST
    Then status 200
    And path "/user/"+data.username
    And method GET
    And status 200
    And print response

  @findAllPetSold
  Scenario: find all name pets sold
    Given path "/pet/findByStatus"
    And param status = 'sold'
    When method GET
    Then status 200
    And print newJson(response)

  @CountNameEquals
  Scenario: count name equals
    Given path "/pet/findByStatus"
    And param status = 'sold'
    When method GET
    Then status 200
    And def jsonResponse = newJson(response)
    And print jsonResponse
    And print nameDuplicate(jsonResponse)