Feature:Put

  Background:
    * def baseURL = 'https://reqres.in'
    * def URL_REGEX = '^https?://[\\w.-]+(?:\\.[\\w.-]+)+.*$'
    * def ISO_DATE_REGEX = '^\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}\\.\\d{3}Z$'

  Scenario:Update user
    * url 'https://reqres.in/api/users/2'
    * request
      """
    {
    "name": "morpheus",
    "job": "zion resident"
    }
      """
    * method put
    * status 200
    * print response
    * match response.updatedAt == '#regex ' + ISO_DATE_REGEX