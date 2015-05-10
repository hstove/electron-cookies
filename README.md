# Electron Cookies

(Formerly called `atom-shell-cookies`)

Adds support for cookies in Electron. Cookies are persisted through localStorage.

Forked from https://gist.github.com/paulcbetts/2d2de55d137a1cf9d1ac.

## Why?

There is no built-in support for `document.cookies` inside Electron's renderer environment, so this package adds that functionality. This way, you can use client-side analytics libraries (like Google Analytics) right in your renderer, and things will work swimmingly.

## Installation

```bash
npm install electron-cookies
```

## Usage

In your app's `renderer` code, just require this package:

```js
require('electron-cookies')
```

## Contributing

Original code is written in `src/index.coffee`, with tests at `spec/electron_cookies_spec.coffee`. Write code in coffeescript, and run `grunt` to compile coffeescript on the fly.
