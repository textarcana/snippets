/**
 * Dynamically load jQuery in compatibility mode and then execute a
 * callback function once jQuery is loaded.
 *
 * Intended for use in hostile environments :) where another JS
 * library has previously been loaded.
 *
 * See http://stackoverflow.com/questions/2074982
 * Also see http://unixpapa.com/js/dyna.html
 */

var jQueryBootstrap = function (callback) {

  var remoteScript = document.createElement('script');

  remoteScript.type = "text/javascript";
  remoteScript.src = "https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js";

  remoteScript.onload = function(){
    var compatible = document.createTextNode('jQuery.noConflict();');
    var compatibilityScript = document.createElement('script');

    compatibilityScript.type = "text/javascript";
    compatibilityScript.appendChild(compatible);

    document
      .getElementsByTagName('head')[0]
      .appendChild(compatibilityScript);

    callback();

  };

  document
    .getElementsByTagName('head')[0]
    .appendChild(remoteScript);
};
