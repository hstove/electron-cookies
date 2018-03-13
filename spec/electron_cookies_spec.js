const {expect} = require('chai');
global.document = {};
// Mock localStorage for tests.
global.localStorage = {
  getItem(item) {
    return global.localStorage[item];
  },
  setItem(item, value) {
    global.localStorage[item] = value;
  }
};

require('../src/index.js');

describe('document.cookies', () =>
  it('should work like a browser', function() {
    expect(document.cookie).to.eql('');
    document.cookie = 'blah';
    expect(document.cookie).to.eql('blah');
    document.cookie = 'key=value';
    expect(document.cookie).to.eql('blah; key=value');
    document.cookie = 'key2=value2';
    expect(document.cookie).to.eql('blah; key=value; key2=value2');
  })
);
