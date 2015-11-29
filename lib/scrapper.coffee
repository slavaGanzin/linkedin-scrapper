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

    result = {}
    for field, operations of mapping
      operations[1] = 'text' unless operations[1]
      result[field] = $(operations[0])[operations[1]]()

    console.log result
    c response: r, $: $, result: result
