var fs = require('fs'),
    file_as_array = [];
fs.readFile('/etc/hosts', 'utf8', function (err,data) {
    if (err) {
        return console.log(err);
    }
    file_as_array = data.split('\n');
});
