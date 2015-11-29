$ = require 'cheerio'
request = require 'request'

module.exports = (publicPageUrl, c) ->
  request publicPageUrl, (e,r) ->
    console.log r.body
    c r
