/**
 * Avoid throwing errors when Firebug is not installed.
 * See http://mattsnider.com/test/debugging-firebug-console-emulator/
 *
 * @todo as written this prevents using the console in WebKit.
 */

$.site.mes_getConsole = function() {
  if (window.console && window.console.firebug) {
    return window.console;
  }
  else {
    return {
      error: function() {},
      debug: function() {},
      info: function() {},
      log: function() {},
      warn: function() {}
    };
  }
};


$(function () {

    if (! window.console)
      window.console = $.site.mes_getConsole();

});
