/**
 * Load jQuery in compatibility mode.  Intended for use in hostile
 * environments :) where another JS library has previously been loaded.
 * 
 * See http://stackoverflow.com/questions/2074982
*/

(function(){
  var compatible = document.createTextNode('jQuery.noConflict();');
  var remoteScript = document.createElement('script');
  var compatibilityScript = document.createElement('script');

  remoteScript.type = "text/javascript";
  compatibilityScript.type = "text/javascript";

  remoteScript.src = "https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js";

  compatibilityScript.appendChild(compatible);

  document
    .getElementsByTagName('body')[0]
    .appendChild(remoteScript);

  document
    .getElementsByTagName('body')[0]
    .appendChild(compatibilityScript);

}());

