var vows = require('vows'),
   assert = require('assert');

require('./env');
require('../legacyCodeExample');

document.body.innerHTML = '<div id="foo"></div><div id="bar"></div>';

vows.describe('A function that searches for classnames').addBatch({
    'puts the values in a global array': {
        topic: function () {
            return getFoo();
        },
        'which should contain all the class names': function (topic) {
            assert.equal (topic, 'foo');
        }
    }
}).export(module);

