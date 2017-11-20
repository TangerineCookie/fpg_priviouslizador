#!/bin/bash
# ------------------------------------------------------------------
# [Author] 	Tangerine Cookie AKA Raingna
#			Genera un priviously y unos cachos de video twiteables 
#			a partir de unos emepetreses.
# ------------------------------------------------------------------
cp 'data/intro.mp3' 'priviously_final.mp3.tmp'
for file in *.mp3;
do
	ffmpeg -loop 1 -i 'data/logo.png' -i $file -c:v libx264 -tune stillimage -c:a aac -b:a 192k -pix_fmt yuv420p -shortest "$file.mp4"
	ffmpeg -i concat:"priviously_final.mp3.tmp|$file|data/claqueta.mp3" -acodec libmp3lame -b:a 112k 'priviously_final_temp.mp3'
	rm 'priviously_final.mp3.tmp'
	mv 'priviously_final_temp.mp3' 'priviously_final.mp3.tmp'
done
ffmpeg -i concat:"priviously_final.mp3.tmp|data/final.mp3" -acodec copy 'priviously_final_temp.mp3'
rm 'priviously_final.mp3.tmp'
mv 'priviously_final_temp.mp3' 'priviously_final.mp3'
mkdir 'output'
mv *.mp4 'output'
mv 'priviously_final.mp3' 'output'

