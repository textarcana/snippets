# Calculates the File Coverage metric for PHPUnit projects.  File
# Coverage is the ratio of PHPUnit test files to PHP class files.

export TESTS=tests/phpunit
export PHPLIB=phplib
#find $PROJECT/**/*\.php | less

find $TESTS/**/*\.php | egrep '(Tests?\.php$)' | perl -lpe 's{$ENV{"TESTS"}/(.*)Tests?.php}{$1}' > /tmp/test_file_identifiers

find $PHPLIB/**/*\.php | perl -lpe 's{$ENV{"PHPLIB"}/(.*).php}{$1}' > /tmp/php_class_file_identifiers

diff -U0 /tmp/test_file_identifiers /tmp/php_class_file_identifiers | egrep '^-[^-]' | cut -c2- > /tmp/tests_without_classes

diff -U0 /tmp/test_file_identifiers /tmp/php_class_file_identifiers | egrep '^\+[^\+]' | cut -c2- > /tmp/classes_without_tests

git log -n1 --format="As of commit %H on %cd"

echo 'Tests without classes\n\n'

# This line munges the name of .*Tests.php files to .*Test.php but
# meh, we shouldn't be doing that any more anyway.
cat /tmp/tests_without_classes | perl -lpe 's{(.*)}{$1Test.php}'

echo '\n\nClasses without tests\n\n'

cat /tmp/classes_without_tests | perl -lpe 's{(.*)}{$1.php}'
