# watchr config that works with the Vows test runner for Node.js
#
# check() is defined in textarcana.watchr

watch( '(.*my_project/)(.*)\.js' )  { |m|
  cmd_string = %{/home/`whoami`/node_modules/vows/bin/vows #{m[1]}test/\*};
  check(cmd_string,  
        m[2] + '.js',
        "Unit Tests")
}
