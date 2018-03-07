(function() {
  var Cookie, FAKE_APP_URI, tough;

  tough = require('tough-cookie');

  Cookie = tough.Cookie;

  FAKE_APP_URI = 'https://yourdomain.heap/';

  (function(document) {
    var cookiejar;
    cookiejar = new tough.CookieJar();
    document.__defineGetter__('cookie', function() {
      return cookiejar.getCookieStringSync(FAKE_APP_URI);
    });
    return document.__defineSetter__('cookie', function(s) {
      return cookiejar.setCookieSync(Cookie.parse(s, {
        loose: true
      }), FAKE_APP_URI);
    });
  })(document);

}).call(this);
