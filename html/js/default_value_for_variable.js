/* 
   To set foo to a custom value, set 
       var foo = 123;
   any time before this script is loaded.

   If you don't set foo, the default value will be used.
  */

var default_for_foo = 789;
var foo = (typeof foo !== 'undefined' ? foo : default_for_foo);
