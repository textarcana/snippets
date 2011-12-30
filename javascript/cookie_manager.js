var cookieManager = {
    set : function ( id, value, expiry) {
        if(!expiry) {
            expiry = 365;
        }

        document.cookie = id
            + '='
            + value
            +';path=/;expires='
            + this.cookieTime(expiry);
    },

    get : function( id, defaultValue ) {
        var re = new RegExp(id+'=(.*)');
        var value = re.exec(document.cookie);

        return (value) ? value[1].split(';')[0] : defaultValue;
    },

    expire : function( id ) {
        document.cookie = id
            + '=;' 
            + 'path=/;expires='
            + this.cookieTime(-1);

        this.set(id, this.get(id, false), -1);
    },

    cookieTime : function (days){
        if (days == -1) {
            return -1;
        }

        var now = new Date();
        var exp = new Date();
        var x   = Date.parse(now) + days*24*60*60*1000;
        var re = '/(\d\d)\s(\w\w\w)\s\d\d(\d\d))/';

        exp.setTime(x);
        str = exp.toUTCString();

        return str.replace(re,"$1-$2-$3");
    }
}


/**
 * Use a URL parameter to toggle between two cookie states.
 *
 * See http://stackoverflow.com/questions/901115                                        
 */

var urlParamTool = function(name){                                                                                                                                            
  var results = new RegExp('[\\?&]' + name + '=([^&#]*)').exec(window.location.href);
  if (!results)
  {
    return 0;
  }
  return results[1] || 0;
};

/**
 * Set an admin mode cookie if the 'mode' query parameter is set to
 * 'expert' or 'admin.'
 * 
 * Set the normal user cookie if the 'mode' query parameter is set to
 * 'normal,' or in the default case where the 'mode' query parameter
 * has not been not set.
 */

if(((urlParamTool('mode') === 'expert' || urlParamTool('mode') === 'admin') ||
    urlParamTool('mode') !== 'normal' && cookieManager.get('admin_mode') === 'activated')){
    cookieManager.set('admin_mode', 'activated');
  // do admin things
} else {
  cookieManager.set('admin_mode', 'inactive');
  // do normal user things
}
