/**
 * Here is some legacy code from 2008.  Obviously it targets Web
 * browsers and is not meant to be run server-side.  But we can test 
 * it server-side, using JSDOM and Vows.
 *
 * Here is what this snippet of code does:
 * 
 * Lists each CSS class name that is applied to an element within an HTML page.
 * 
 * Some applications suggested by this pattern are: 
 * - List class names by frequency of use. 
 * - List class names by what kind of element they are applied to. 
 * - List class names that are only used once.
 */

var allTags = document.body.getElementsByTagName('*');
var classNames = {};
for (var tg = 0; tg< allTags.length; tg++) {
    var tag = allTags[tg];
    if (tag.className) {
      var classes = tag.className.split(" ");
	for (var cn = 0; cn < classes.length; cn++){
	  var cName = classes[cn];
	  if (! classNames[cName]) {
	    classNames[cName] = true;
	  }
	}
    }   
}
var classList = [];
for (var name in classNames) classList.push(name);
alert(classList);
