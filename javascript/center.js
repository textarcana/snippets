/* See http://stackoverflow.com/a/1248126/55478 
 * and http://stackoverflow.com/a/442474/55478
 *
 * needs some work for compatibility with older MSIE versions -- with
 * regard to clientWidth/Height and innerWidth/Height
 *
 * using all global variables for ease of debugging, not recommended
 * for production
 */

var elem, getOffset, reposition, center, center2, stayCentered;

stayCentered = function  (el) {

    center = function (property1, property2, property3) {
        console.log('window[%s]=', property2, window[property2]);
        console.log('el[%s]=', property3, window[property2]);
        console.log('CSS %s=', property1, el.style[property1]);
        el.style[property1] = window[property2]/2 - el[property3] + 'px';
    }

    reposition = function(){
        el.style.margin = 0;
        center('left', 'innerWidth', 'clientWidth');
        center('top', 'innerHeight', 'clientHeight');
    };

    el.style.position='absolute';
    el.style.top='0';

    window.onresize=reposition;

    reposition();

}
