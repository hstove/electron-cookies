# Electron Cookies

(Formerly called `atom-shell-cookies`)

Adds support for cookies in Electron. Cookies are persisted through localStorage.

Forked from https://gist.github.com/paulcbetts/2d2de55d137a1cf9d1ac.

## Why?

Electron's `renderer` environment doesn't come with built in support for a `document.cookie` API. Thus, if you want to use Google Analytics or another client-side analytics library, they won't work because they can't set cookies.

By using this package, you can drop client-side analytics code into your app and it will work splendidly.

## Installation

```bash
npm install electron-cookies
```

## Usage

In your app's `renderer` code, just require this package:

```js
require('electron-cookies')
```

## Limitations

Electron Cookies adds a small shim so `document.cookie` works on the client-side as expected. It does not, however, enable Electron to process cookies as a browser normally would. Limitations include:

- cookies will not automatically be sent along with domain-specific requests.
- `set-cookie` response headers will not automatically be processed and set.
- no support for `httpOnly`, `maxAge`, or other cookie options.

If your use case relies on any of this additional cookie functionality, we recommend that you perform all cookie handling from Electron's `main` process and proxy the results back to the client-side `renderer`.

## Contributing

Original code is written in `src/index.coffee`, with tests at `spec/electron_cookies_spec.coffee`. Write code in coffeescript, and run `grunt` to compile coffeescript on the fly.
