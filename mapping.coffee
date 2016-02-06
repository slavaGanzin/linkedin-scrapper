module.exports =
  sections:
    fullname: selector: '#name'
    headline: selector: '.headline.title'
    industry: selector: '#demographics > .descriptor:not(.adr)'
    websites: selector: '.websites li a'
    summary: selector: '#summary > .description'
    skills: selector: 'li.skill'

    experience:
      selector:  '.positions > .position'
      mapping:
        company: '.item-subtitle'

    certification:
      selector:    '.certifications > .certification'
      mapping:
        authority: '.item-subtitle'

    education:
      selector:      '.schools > .school'
      mapping:
        grade:       '.item-subtitle'
        description: '.description p'

    projects:
      selector:       '#projects .project'
      mapping:
        link:
          selector:   'a'
          method:     'attr'
          parameters: 'href'


  defaultSectionMapping:
    title:       '.item-title'
    description: '.description'
    date:        '.date-range'
