# Just print the line and token count per file, no code sniffer results.

phpcs -v --standard=Squiz $1 | grep 'tokens' | cut -d' ' -f2-7 | sort -rn -k5