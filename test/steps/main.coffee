assert = require 'assert'
English = require('yadda').localisation.English
R = require 'ramda'
scrapper = require '../../lib/scrapper'

response = null

module.exports = do ->
  English.library()
  .when '$url scrapped', (url, next) ->
    scrapper url, (r, $)-> response = r; next()

  .then 'status is $NUM', (num, next) ->
    assert.equal response.statusCode, parseInt num
    next()
