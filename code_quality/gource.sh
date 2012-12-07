# generate gource visualization of a git repository
#
# the code in backticks provides the name of the active git branch

gource --title `git symbolic-ref HEAD | cut -d'/' -f3` --key --highlight-users --hide filenames

# Generate a movie.
# See http://rubyist-journal.com/2011/05/05/create-artwork-with-gource/

gource  --title `git symbolic-ref HEAD | cut -d'/' -f3` --key --font-size 20 --highlight-all-users -1920x1080 --stop-at-end -s 0.2 -i 63072000 --hide filenames,bloom,progress,mouse -o - | ffmpeg -y -b 3000K -r 60 -f image2pipe -vcodec ppm -i - -vcodec libx264 -threads 0 video.mp4



