/* load jquery */

(function(){
  var script = document.createElement('script');

  script
    .type = "text/javascript"
    .src = "https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js";

  document
    .getElementsByTagName('body')[0]
    .appendChild(script);
}());
