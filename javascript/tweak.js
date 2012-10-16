/* Optionally call this method to make stained elements draggable, for
 * maximum ease of repositioning. This is going to be soooooo much
 * easier than tweaking the left / right position in Firebug!
 *
 * You can define a .stain class like this, to make the elements more
 * obvious:
 *
 * .stain {
 *    background: #bf3d3d;
 *    opacity: 0.2;
 * }
 *
 *
 * Requires jQuery UI.
 */

var tweak = function (el) {
    'use strict';

    $(el).each(function (index, element) {
        element.title += element.className;
    });

    $(el).draggable().off('click');
    $(el).addClass('stain');
};
