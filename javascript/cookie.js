var Util = {
    cookie : {
        set : function ( id, value, expiry) {
            if(!expiry) {
                expiry = 365;
            }

            document.cookie = id
                + '='
                + value
                +';path=/;domain=.onemorebug.com;expires='
                + this.cookieTime(expiry);
        },

        get : function( id, defaultValue ) {
            var re = new RegExp(id+'=(.*)');
            var value = re.exec(document.cookie);

            return (value) ? value[1].split(';')[0] : defaultValue;
        },

        expire : function( id, domain ) {
            if(!domain) domain = '.onemorebug.com';

            document.cookie = id
                + '=;domain=' 
                + domain 
                + ';path=/;expires='
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
}
