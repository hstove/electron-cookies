tough = require 'tough-cookie'
WebStorageCookieStore = require 'tough-cookie-web-storage-store'

Cookie = tough.Cookie

# This should resemble a real URI, but have a fake TLD. We don't want to have it so that
# it's possible to send these cookies to a domain someone could register after the fact, but
# for Heap, we need a parseable URI because internally we try to determine the right level to set
# a cookie, rather than having a known set of public suffix domains.
FAKE_APP_URI = 'https://yourdomain.heap/'

do (document) ->
  store = new WebStorageCookieStore(localStorage)

  cookiejar = new tough.CookieJar(store)
  document.__defineGetter__ 'cookie', ->
    cookiejar.getCookieStringSync FAKE_APP_URI

  document.__defineSetter__ 'cookie', (s) ->
    # loose: true lets us accept cookies with key and no value, which the
    # original tests for this library included.
    cookiejar.setCookieSync Cookie.parse(s, {loose: true}), FAKE_APP_URI
