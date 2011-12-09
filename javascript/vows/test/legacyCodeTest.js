var vows = require('vows'),
   assert = require('assert');

require('./env');
require('../legacyCodeExample');

document.body.innerHTML = '<div id="foo" class="baz"></div><div id="bar" class="boz"></div>';

vows.describe('some legacy JS written for the browser').addBatch({
    'has a function that gets foo': {
        topic: function(){
            return getAnId();
        },
        'which should return foo': function (topic) {
            assert.equal(topic, 'foo');
        }
    },
    'has a function that finds bar': {
        topic: function(){
            return getAClassName();
        },
        'which should return bar': function (topic) {
            assert.equal(topic, 'boz');
        }
    }
}).export(module);

