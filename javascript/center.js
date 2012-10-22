/* See http://stackoverflow.com/a/1248126/55478 
 * and http://stackoverflow.com/a/442474/55478
 */

var stayCentered = function  (el) {

    var elem, getOffset, reposition, center, center2;

    elem = (document.compatMode === "CSS1Compat") ? 
        document.documentElement :
        document.body;

    getOffset = function (el) {
        var _x = 0;
        var _y = 0;
        while( el && !isNaN( el.offsetLeft ) && !isNaN( el.offsetTop ) ) {
            _x += el.offsetLeft - el.scrollLeft;
            _y += el.offsetTop - el.scrollTop;
            el = el.offsetParent;
        }
        return { top: _y, left: _x };
    }

    center = function (property1, property2) {
        document.
            getElementById('shout').
            style[property1] = elem[property2]/2-getOffset(el)[property1]/2+'px';
    }

    center2 = function (property1, property2) {

        console.log('window[%s]=', property2, window[property2]);
        console.log('CSS %s=', property1, el.style[property1]);
        document.
            getElementById('shout').
            style[property1] = window[property2]/2+'px';
    }

    reposition = function(){
        el.style.margin = 0;
        el.style.marginLeft = '-150px';
        el.style.marginTop = '-150px';
        center2('left', 'innerWidth');
        center2('top', 'innerHeight');
    };

    el.style.position='absolute';
    el.style.top='0';

    window.onresize=reposition;

    reposition();

}

stayCentered(document.getElementById('shout'));
