/* Draw a diagram of the method hierarchy of an object.
 * Go two levels deep.
 */

var assert = require('assert'),
    json = require('json3'),
    prettyjson = require('prettyjson'),
    getMethodsFor,
    methodMap;

getMethodsFor = function (o) {
    var methods = [];
    for (name in o) {
        if (o.hasOwnProperty(name)) {
            methods.push(name);
        }
    }
    return methods.sort();
}

assert('undefined' !== typeof getMethodsFor({}).length, 
       'should get an array of methods');

methodMap = getMethodsFor(window.foo)
    .map(function (el, index, arr) {
        return [el, getMethodsFor(window.foo[el])];
    });

console.log(
    json.stringify(methodMap)
        + '\n'
        + prettyjson.render(methodMap)
);

process.exit();
