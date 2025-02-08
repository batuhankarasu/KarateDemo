Feature:Post

  Background:
    * def baseURL = 'https://reqres.in'
    * def URL_REGEX = '^https?://[\\w.-]+(?:\\.[\\w.-]+)+.*$'
    * def ISO_DATE_REGEX = '^\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}\\.\\d{3}Z$'

  Scenario: Create a user
    * url baseURL
    * path '/api/users'
    * request
      """
      {
        "name": "morpheus",
        "job": "leader"
      }
      """
    * method post
    * status 201
    * print response
    * match response == {name: 'morpheus', job: 'leader', id: '#notnull', createdAt: '#notnull'}
    * match response.createdAt == '#regex ' + ISO_DATE_REGEX