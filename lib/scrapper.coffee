cheerio = require 'cheerio'
request = require 'request'
mapping = require '../mapping'

module.exports = (publicPageUrl, c) ->
  request publicPageUrl, (e,r) ->
    $ = cheerio.load r.body

    $::grabWebsites = ->
      websites = {}
      @.find('li a').each(-> websites[$(@).text().replace(/ Website/,'').toLocaleLowerCase()] = $(@).attr('href'))
      websites

    $::grabExperience = ->
      experience = []
      @.find('.position').each(-> experience.push {
          title: $(@).find('.item-title').text()
          company: $(@).find('.item-subtitle').text()
          description: $(@).find('.description').text()
          date:
            from: $(@).find('.date-range').text().replace(/ –.*/,'')
            to: $(@).find('.date-range').text().replace(/.*– /,'')
      })
      experience

    $::grabCertification = ->
      certification = []
      @.find('.certification').each(-> certification.push {
          title: $(@).find('.item-title').text()
          authority: $(@).find('.item-subtitle').text()
          date:
            from: $(@).find('.date-range').text().replace(/ –.*/,'')
            to: $(@).find('.date-range').text().replace(/.*– /,'')
      })
      certification


    result = {}
    for field, operations of mapping
      operations[1] = 'text' unless operations[1]
      result[field] = $(operations[0])[operations[1]]()

    console.log result.certification[0]
    c response: r, $: $, result: result
