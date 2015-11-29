assert = require 'assert'
English = require('yadda').localisation.English
R = require 'ramda'
scrapper = require '../../lib/scrapper'

response = null
result = null

module.exports = do ->
  English.library()
  .when '$url scrapped', (url, next) ->
    scrapper url, ({response: _response, $: $, result: _result}) ->
      response = _response
      result = _result
      next()


  .then 'status is $NUM', (num, next) ->
    assert.equal response.statusCode, parseInt num
    next()

  .then '$field is $value', (field, value, next) ->
    result[field] = R.path field.split('.'), result if /\./.test(field)
    assert.equal String(result[field]), value
    next()
