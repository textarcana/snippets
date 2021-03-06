# totals and averages of the token and line counts produced by
# PHPCodeSniffer verbose output

phpcs -v --standard=Squiz $1 | \
     perl -lne 'BEGIN{
                      $tokens=0;
                      $lines=0;
                      $files=0;
                };
                m{(\d+) tokens in (\d+) lines} and $tokens += $1 and $lines += $2 and $files++;
                END{
                    $avg_tokens = ($tokens / $files);
                    $avg_lines  = ($lines  / $files);
                    printf(qq{%i files: %i tokens in %i lines.\n%i tokens, %i lines average per file.\n}, 
                           $files, $tokens, $lines, $avg_tokens, $avg_lines);
                }'
