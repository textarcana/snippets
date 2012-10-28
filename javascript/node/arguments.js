#!/usr/bin/env node

/* see http://stackoverflow.com/questions/4351521/how-to-pass-command-line-arguments-to-node-js */

var argv = require('optimist').argv;

console.log(argv);
