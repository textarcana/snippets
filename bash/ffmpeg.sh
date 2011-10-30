# number PNG files sequentially for use with ffmpeg

ls . | sort -n | perl -ne 'BEGIN{$i=0}; chomp; m/(.*)_for_.*(\.png)/; $x = sprintf("%s-%04d%s", $1, $i++, $2); system("mv", "$_", "$x");'


# make a movie with the files

ffmpeg -s 2896x1944 -f image2 -r 6 -i ./%06d.jpg -sameq ./halloween.mov -pass 2