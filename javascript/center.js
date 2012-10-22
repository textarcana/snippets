/* See http://stackoverflow.com/a/1248126/55478 
 * and http://stackoverflow.com/a/442474/55478
 *
 * needs some work for compatibility with older MSIE versions -- with
 * regard to clientWidth/Height and innerWidth/Height
 *
 * using all global variables for ease of debugging, not recommended
 * for production
 *
 * one of the keys here is the use of position:fixed, which causes the
 * centered element to be positioned relative to the browser window
 * rather than the document body. This means you can reposition the
 * body and it won't affect the position of the centered element.
 */

var target, reposition, center, center2, stayCentered, getXY;

stayCentered = function  (el) {
    
    target = el;

    getXY = function (el) {
        var _x = 0;
        var _y = 0;
        while( el && !isNaN( el.offsetLeft ) && !isNaN( el.offsetTop ) ) {
            _x += el.offsetLeft - el.scrollLeft;
            _y += el.offsetTop - el.scrollTop;
            el = el.offsetParent;
        }
        return [_x, _y];
    }


    center = function (property1, property2, property3) {
        console.log('window[%s]=', property2, window[property2]);
        console.log('el[%s]=', property3, window[property2]);
        console.log('CSS %s=', property1, el.style[property1]);
        el.style[property1] = window[property2]/2 - el[property3]/2 + 'px';
    }

    reposition = function(){
        el.style.margin = 0;
        center('left', 'innerWidth', 'clientWidth');
        center('top', 'innerHeight', 'clientHeight');
    };

    el.style.position='fixed';
    el.style.top='0';

    window.onresize=reposition;

    reposition();

}
