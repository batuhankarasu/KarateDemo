Feature:Delete

  Background:
    * def baseURL = 'https://reqres.in'
    * def URL_REGEX = '^https?://[\\w.-]+(?:\\.[\\w.-]+)+.*$'
    * def ISO_DATE_REGEX = '^\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}\\.\\d{3}Z$'

  Scenario: Delete
    * url 'https://reqres.in/api/users/2'
    * method Delete
    * status 204

  Scenario: Verify deleted user
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then status 404