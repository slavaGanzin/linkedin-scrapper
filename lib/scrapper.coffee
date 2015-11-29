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
          daterange: daterange = $(@).find('.date-range').text()
          date:
            from: daterange.replace(/ –.*/,'')
            to: daterange.replace(/.*– /,'')
      })
      experience

    result = {}
    for field, operations of mapping
      operations[1] = 'text' unless operations[1]
      result[field] = $(operations[0])[operations[1]]()

    console.log result.experience
    c response: r, $: $, result: result
