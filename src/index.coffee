do (document) ->
  localStorage.cookies ||= '{}'
  document.__defineGetter__ 'cookie', ->
    cookies = JSON.parse(localStorage.cookies || '{}')
    output = []
    for cookieName, val of cookies
      validName = cookieName && cookieName.length > 0
      res = if validName then "#{cookieName}=#{val}" else val
      output.push res
    output.join '; '

  document.__defineSetter__ 'cookie', (s) ->
    n = s.indexOf('=')
    if n > 0
      key = s.substring(0, n)
      value = s.substring(n + 1)
    else
      value = s
      key = ''
    cookies = JSON.parse(localStorage.cookies || '{}')
    cookies[key] = value
    localStorage.cookies = JSON.stringify(cookies)
    key + '=' + value

  document.clearCookies = -> delete localStorage.cookies

  # Pretend that we're hosted on an Internet Website
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
