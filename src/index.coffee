tough = require 'tough-cookie'
Cookie = tough.Cookie

# This should resemble a real URI, but have a fake TLD. We don't want to have it so that
# it's possible to send these cookies to a domain someoen could register after the fact, but
# for Heap, we need a real TLD because internally we try to determine the right level to set
# a cookie.
FAKE_APP_URI = 'https://yourdomain.heap/'

do (document) ->
  cookiejar = new tough.CookieJar()
  document.__defineGetter__ 'cookie', ->
    #cookiejar.getCookies FAKE_APP_URI, (err, cookies) ->
    #  return cookies
    cookiejar.getCookieStringSync FAKE_APP_URI

  document.__defineSetter__ 'cookie', (s) ->
    # Don't return anything or run the callback.
    # cookiejar.setCookie Cookie.parse(s), FAKE_APP_URI
    console.log s
    cookiejar.setCookieSync Cookie.parse(s, {loose: true}), FAKE_APP_URI

###
  document.__defineGetter__ 'location', ->
    url = 'electron-renderer.com'

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
###
