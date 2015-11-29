cheerio = require 'cheerio'
request = require 'request'
mapping = require '../mapping'
R = require 'ramda'

module.exports = (publicPageUrl, c, additionalMapping={}) ->
  request publicPageUrl, (e,r) ->
    $ = cheerio.load r.body

    result = websites: {}

    mapping = R.merge mapping, additionalMapping
    for field, o of mapping.sections
      if field == 'skills'
        result.skills = $(o.selector).map(-> $(@).text()).get()

      else if field == 'websites'
        $(o.selector).map ->
          k = $(@).text().replace(/ Website/,'').toLowerCase()
          result.websites[k] = $(@).attr('href')

      else if not o.mapping
        result[field] = $(o.selector).text()

      else
        result[field] = $(o.selector).map(->
          R.mapObjIndexed (v,k) =>
            if k == 'date'
              date =  $(@).find(v).text()
              from: date.replace(/ –.*/,'')
              to:  date.replace(/.*– /,'') if /–/.test date
            else if R.is String, v
              $(@).find(v).text()
            else
              $(@).find(v.selector)[v.method](v.parameters)

          ,R.merge mapping.defaultSectionMapping, o.mapping
        ).get()

    c response: r, $: $, result: result
