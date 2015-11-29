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

Scenario: Parse Experience
  Then experience.0.title is Second position
  Then experience.0.company is Second company
  Then experience.0.description is Second description
  Then experience.0.date.from is January 2000
  Then experience.0.date.to is Present (15 years 11 months)
  Then experience.1.title is First job
  Then experience.1.company is First company
  Then experience.1.description is First description
  Then experience.1.date.from is July 1999
  Then experience.1.date.to is September 2000 (1 year 3 months)

Scenario: Parse Certifications
  Then certification.0.title is Certificate certified
  Then certification.0.authority is Certification Authority, License License number
  Then certification.0.date.from is April 2000
  Then certification.0.date.to is June 2000
