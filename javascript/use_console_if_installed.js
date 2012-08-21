/**
 * Avoid throwing errors in browsers that do not have a console, and
 * disable the console when not running in debug mode.
 *
 * See also http://mattsnider.com/test/debugging-firebug-console-emulator/
 */

/*jslint browser:true */

var debugging_is_enabled = true,
    console;

if (debugging_is_enabled === true && typeof window.console !== "undefined" && window.console) {
    console = window.console;
} else {
    console = {
        error: function () {},
        debug: function () {},
        info: function () {},
        log: function () {},
        warn: function () {}
    };
}
