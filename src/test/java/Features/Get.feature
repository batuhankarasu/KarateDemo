Feature: Get

  Background:
    * def baseURL = 'https://reqres.in'
    * def URL_REGEX = '^https?://[\\w.-]+(?:\\.[\\w.-]+)+.*$'
    * def ISO_DATE_REGEX = '^\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}\\.\\d{3}Z$'


  Scenario: List of users
    * url baseURL
    * path '/api/users?page=2'
    * method GET
    * status 200
    * print response
    * match response.page == '#number'
    * match response.data[0].id == '#number'
    * match response.data[0].name == '#string'
    * match response.data[0].color == '#notnull'
    * match response.data[0].pantone_value == '#notnull'
    * match response.support.url == '#regex ' + URL_REGEX

  Scenario: Single user
    * url baseURL
    * path '/api/users/2'
    * method GET
    * status 200
    * print response
    * match response.data.id == '#number'
    * match response.data.email == '#notnull'
    * match response.data.first_name == '#string'
    * match response.data.last_name == '#string'
    * match response.data.avatar == '#regex ' + URL_REGEX
    * match response.support.url == '#regex ' + URL_REGEX

  Scenario: Single User Not Found
    * url baseURL
    * path '/api/users/23'
    * method GET
    * status 404
    * print response




