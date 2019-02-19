(function() {
  (function(document) {
    localStorage.cookies || (localStorage.cookies = '{}');
    document.__defineGetter__('cookie', function() {
      var cookieName, cookies, output, res, val, validName;
      cookies = JSON.parse(localStorage.cookies || '{}');
      output = [];
      for (cookieName in cookies) {
        val = cookies[cookieName];
        validName = cookieName && cookieName.length > 0;
        res = validName ? cookieName + "=" + val : val;
        output.push(res);
      }
      return output.join('; ');
    });
    document.__defineSetter__('cookie', function(s) {
      var cookies, key, parts, value;
      n = s.indexOf('=');
      if (n > 0) {
        key = s.substring(0,n), value = s.substring(n+1);
      } else {
        value = s;
        key = '';
      }
      cookies = JSON.parse(localStorage.cookies || '{}');
      cookies[key] = value;
      localStorage.cookies = JSON.stringify(cookies);
      return key + '=' + value;
    });
    document.clearCookies = function() {
      return delete localStorage.cookies;
    };
    document.__defineGetter__('location', function() {
      var url;
      url = 'electron-renderer.com';
      return {
        href: 'http://' + url,
        protocol: 'http:',
        host: url,
        hostname: url,
        port: '',
        pathname: '/',
        search: '',
        hash: '',
        username: '',
        password: '',
        origin: 'http://' + url
      };
    });
    return document.__defineSetter__('location', function() {});
  })(document);

}).call(this);
