#!/bin/bash
# ------------------------------------------------------------------
# [Author] 	Tangerine Cookie AKA Raingna
#			Genera unos cachos de video twiteables con la imagen de
#			DLC GRATIS a partir de un emepetres.
# ------------------------------------------------------------------

ffmpeg -loop 1 -i 'data/logo_dlc.png' -i $1 -c:v libx264 -tune stillimage -c:a aac -b:a 192k -pix_fmt yuv420p -shortest "$1_dlc.mp4"	



