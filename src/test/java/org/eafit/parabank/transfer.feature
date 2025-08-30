@parabank_transfer
Feature: Tranfer to Parabank

  Background:
    * url baseUrl
    * header Accept = 'application/json'
    * def accountto = 13677
    * def amount = 12
    * def name = 'prueba'
    * def street = 'street'
    * def city = 'medellin'
    * def state = 'antioquia'
    * def zipCode = '0444'
    * def phoneNumber = '445555'
    * def accountNumber = 13566

  Scenario: Customer Transfer
      Given path 'billpay'
      And param accountId = accountId
      And param amount = amount
      And request 
       """
    {
       "name": "#(prueba)",
       "address": {
         "street": "#(street)",
          "city": "#(city)",
          "state": "#(state)",
          "zipCode": "#(zipCode)"
        },
       "phoneNumber": "#(phoneNumber)",
       "accountNumber": #(accountNumber)
    }
    """
       When method post
       Then status 400
       And match response == """ { "payeeName": "prueba", "amount": 12, "accountId": 13566 } """

