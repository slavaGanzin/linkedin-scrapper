Feature: Test all features
Scenario: Get the page
  When https://ua.linkedin.com/in/test-guy-12160410b scrapped
  Then status is 200

Scenario: Parse basic
  Then fullname is Test Guy
  Then headline is Second position at Second company
  Then industry is Apparel & Fashion
  Then websites.personal is https://www.linkedin.com/redir/redirect?url=http%3A%2F%2Fpersonal%2Ewebsite&urlhash=uQnZ&trk=ppro_website
  Then websites.company is https://www.linkedin.com/redir/redirect?url=http%3A%2F%2Fcompany%2Ewebsite&urlhash=2nye&trk=ppro_website

  Then summary is Summary text
