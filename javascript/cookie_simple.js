/**                                                                                                                              
 * get and set session cookies                                                                                                   
 */

jQuery.cookieManager = {
    set : function ( id, value, expiry) {

        var newCookie = id
            + '='
            + value;

        document.cookie = newCookie;
    },

    get : function( id, defaultValue ) {
        var re = new RegExp(id+'=(.*)');
        var value = re.exec(document.cookie);

        return (value) ? value[1].split(';')[0] : defaultValue;
    }
};
