# Electron Cookies

(Formerly called `atom-shell-cookies`)

Adds support for cookies in Electron. Cookies are persisted through localStorage.

Forked from https://gist.github.com/paulcbetts/2d2de55d137a1cf9d1ac.

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

Original code is written in `index.coffee`. Write code in coffeescript, and run `guard` to compile coffeescript on the fly.
