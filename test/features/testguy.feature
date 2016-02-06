Feature: Test all features
Scenario: Get the page
  When https://www.linkedin.com/in/test-guy-12160410b scrapped
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
  Then experience.0.date.to is April 2015 (15 years 4 months)
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

Scenario: Parse Education
  Then education.0.title is Massachusetts Institute of Technology
  Then education.0.grade is High School, Field of study, Grade
  Then education.0.date.from is 2003
  Then education.0.date.to is 2017
  Then education.0.description is Education description

Scenario: Parse skills
  Then skills.0 is skill1
  Then skills.1 is skill2
  Then skills.2 is skill3

Scenario: Parse projects
  Then projects.0.title is Project 1
  Then projects.0.description is Description of project 1
  Then projects.0.date.from is Starting January 2012
  Then projects.0.date.to is undefined
  Then projects.0.link is https://www.linkedin.com/redir/redirect?url=http%3A%2F%2Fproject%2Eone%2Eurl&urlhash=xt2h&trk=prof-project-name-title
