do (document) ->
  localStorage.cookies ||= '{}'
  document.__defineGetter__ 'cookie', ->
    cookies = JSON.parse(localStorage.cookies)
    output = []
    for cookieName, val of cookies
      output.push cookieName + '=' + val
    output.join ';'

  document.__defineSetter__ 'cookie', (s) ->
    indexOfSeparator = s.indexOf('=')
    key = s.substr(0, indexOfSeparator)
    value = s.substring(indexOfSeparator + 1)
    cookies = JSON.parse(localStorage.cookies)
    cookies[key] = value
    localStorage.cookies = JSON.stringify(cookies)
    key + '=' + value

  document.clearCookies = ->
    delete localStorage.cookies
    return

  # Pretend that we're hosted on an Internet Website
  document.__defineGetter__ 'location', ->
    url = 'neuro-valley-visual.com'

    href: 'http://' + url
    protocol: 'http:'
    host: url
    hostname: url
    port: ''
    pathname: '/'
    search: ''
    hash: ''
    username: ''
    password: ''
    origin: 'http://' + url

  document.__defineSetter__ 'location', ->

module.exports = exports =
  track: (name, opts) ->
    unless process.env.DRYRUN == 'true'
      analytics.track name, opts

exports.track 'app-open'
