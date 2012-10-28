/* simple assert, for the browser */

var assert = function (expected, actual, message) {
    var condition = expected === actual;

    if (typeof message !== 'string') {
        message = '';
    }

    if (condition !== true) {
        throw new Error(message +
                        '\n\texpected: ' + expected +
                        '\n\tbut got: ' + actual);
    } else {
        return condition;
    }
};
