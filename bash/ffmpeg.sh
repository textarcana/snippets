# number PNG files sequentially for use with ffmpeg

ls . | sort -n | perl -ne 'BEGIN{$i=0}; chomp; m/(.*)_for_.*(\.png)/; $x = sprintf("%s-%04d%s", $1, $i++, $2); system("mv", "$_", "$x");'


# make a movie with the files

ffmpeg -f image2 -r 24 -i ./frames/the_deep_shoals_of_continuous_deploy-%04d.png? -sameq ./shoals.mov -pass 2
