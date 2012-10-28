/* Delay the execution of an onscroll action until after the user has
 * stopped scrolling the page.
 */

var mostRecentScrollEventTimestamp,
    afterScroll;

mostRecentScrollEventTimestamp = 0;

afterScroll = function () {
    var timestamp = Date.now();
    mostRecentScrollEventTimestamp = timestamp;

    setTimeout(function () {
        var durationSinceLastScroll = timestamp - mostRecentScrollEventTimestamp;
        if (durationSinceLastScroll === 0) {
            console.log('Scrolling has stopped.');
        }
    }, 250);
};

window.onscroll = afterScroll;
