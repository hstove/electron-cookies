# Electron Cookies

Forked from https://github.com/hstove/electron-cookies

Changes from the original:
- Uses [Tough Cookie](https://github.com/salesforce/tough-cookie) for cookie parsing and storage.
- Uses [Tough Cookie Web Storage](https://github.com/expo/tough-cookie-web-storage-store) to persist cookies in localStorage.
- Converted to vanilla JavaScript.

## Installation

In your `package.json` include:

```json
dependencies: {
  "electron-cookies": "heap/electron-cookies"
}
```

Then in your app's renderer code, require the package:
```js
require('electron-cookies');
```

<details>
  <summary>Original README</summary>
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

## Contributing

Original code is written in `src/index.coffee`, with tests at `spec/electron_cookies_spec.coffee`. Write code in coffeescript, and run `grunt` to compile coffeescript on the fly.
</details>
