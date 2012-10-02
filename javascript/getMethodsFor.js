/**
 * get all the methods / properties of an object
 *
 * note this does not do deep recursion, just gets you the top-level
 * property names
 */

var getMethodsFor = function (o) {
    var methods = [],
        methodName;

    for (methodName in o) {
        if (o.hasOwnProperty(methodName)) {
            methods.push(methodName);
        }
    }

    return methods.sort();
};
