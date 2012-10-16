/*jslint browser:true */
/*global $ */

$(function () {
    'use strict';

    var locationsForScripts = [
        'js/myScript.js',
        'js/myOtherScript.js',
        'js/yetAnotherScript.js'
    ],

        createScriptTag = function (i, src) {
            $('head')
                .append(
                    '<script src="' +
                        src +
                        '" type="text/javascript" ' +
                        'charset="utf-8"></script>'
                );
        };

    $(locationsForScripts).each(createScriptTag);
});
