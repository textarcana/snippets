/**
 * Here is some JS designed for use in a browser.  But we can test it *
 * on the command line using Vows and JSDOM.
 *
 * Note that I am intentionally not declaring global variables with
 * the var keyword.  Global variables declared with var are ignored by
 * Node.
 */

getAnId = function () {
    return document.getElementById('foo').id;
};

getAClassName = function(){
    return document.getElementsByClassName('boz')[0].className;
};