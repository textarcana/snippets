# Calculates the File Coverage metric for PHPUnit projects.  File
# Coverage is the ratio of PHPUnit test files to PHP class files.

export PROJECT=Web/tests/phpunit
find $PROJECT/**/*\.php | less

