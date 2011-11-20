# Calculates the File Coverage metric for PHPUnit projects.  File
# Coverage is the ratio of PHPUnit test files to PHP class files.

export TESTS=tests/phpunit
export PHPLIB=phplib
#find $PROJECT/**/*\.php | less

find $TESTS/**/*\.php | egrep '(Tests?\.php$)' | perl -lpe 's{$ENV{"TESTS"}/(.*)Tests?.php}{$1}' > /tmp/test_file_identifiers

find $PHPLIB/**/*\.php | perl -lpe 's{$ENV{"PHPLIB"}/(.*).php}{$1}' > /tmp/php_class_file_identifiers

diff -U0 /tmp/test_file_identifiers /tmp/php_class_file_identifiers | egrep '^-[^-]' | cut -c2- > /tmp/tests_without_classes

diff -U0 /tmp/test_file_identifiers /tmp/php_class_file_identifiers | egrep '^\+[^\+]' | cut -c2- > /tmp/classes_without_tests

export TOTAL_CLASS_FILES=`cat /tmp/php_class_file_identifiers | wc -l | bc`
export UNTESTED_CLASSES=`cat /tmp/classes_without_tests | wc -l | bc`
export CLASSES_WITH_TESTS=`echo $TOTAL_CLASS_FILES - $TESTED_CLASSES | bc`
export PERCENTAGE_OF_TESTED_CLASSES=`echo "scale=4; $CLASSES_WITH_TESTS / $TOTAL_CLASS_FILES * 100" | bc | cut -c-4`

git log -n1 --format="As of commit %H on %cd"

echo "\n\t~$PERCENTAGE_OF_TESTED_CLASSES% file coverage for $PHPLIB"

echo "\n\t$CLASSES_WITH_TESTS PHP class files with tests"

echo "\t$UNTESTED_CLASSES without tests"

echo "\t$TOTAL_CLASS_FILES PHP class files total found in $PHPLIB"

echo '\n\nUntested Classes\n\n'

cat /tmp/classes_without_tests | perl -lpe 's{(.*)}{$1.php}'

echo '\n\nTests That Do Not Cover A Class (possibly obsolete)\n\n'

# This line munges the name of .*Tests.php files to .*Test.php but
# meh, we shouldn't be doing that any more anyway.
cat /tmp/tests_without_classes | perl -lpe 's{(.*)}{$1Test.php}'
