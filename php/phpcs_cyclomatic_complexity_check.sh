# Here is how to just do the built-in Cyclomatic Complexity sniff,
# without any other sniffs.
#
# See also http://stackoverflow.com/questions/4457715/pear-codesniffer-cyclomatic-complexity

phpcs -v --sniffs=Generic.Metrics.CyclomaticComplexity,Generic.Sniffs.Metrics.NestingLevelSniff --standard=Squiz $1
