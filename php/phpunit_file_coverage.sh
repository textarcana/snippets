# Calculates the File Coverage metric for PHPUnit projects.  File
# Coverage is the ratio of PHPUnit test files to PHP class files.

export TESTS=Web/tests/phpunit
export PHPLIB=Web/phplib
#find $PROJECT/**/*\.php | less

find $TESTS/**/*\.php | egrep '(Tests?\.php$)' | perl -lpe 's{$ENV{"TESTS"}/(.*)Tests?.php}{$1}' > /tmp/test_file_identifiers

find $PHPLIB/**/*\.php | perl -lpe 's{$ENV{"PHPLIB"}/(.*).php}{$1}' > /tmp/php_class_file_identifiers

diff -U0 /tmp/test_file_identifiers /tmp/php_class_file_identifiers | egrep '^-[^-]' | cut -c2- > /tmp/tests_without_classes

diff -U0 /tmp/test_file_identifiers /tmp/php_class_file_identifiers | egrep '^\+[^\+]' | cut -c2- > /tmp/classes_without_tests

echo 'Tests without classes\n\n'

cat /tmp/tests_without_classes | perl -lpe 's{(.*)}{$1Test.php}'

echo '\n\nClasses without tests\n\n'

cat /tmp/classes_without_tests | perl -lpe 's{(.*)}{$1.php}'
