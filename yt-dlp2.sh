#!/bin/bash
clear
echo "Youtube Downloader"
echo ""
read -p "Input Youtube URL link: " url
# dir=~/Video
# cd ~/Video
yt-dlp --write-auto-sub --sub-format vtt --sub-lang ru,en,lv -P ~/Video/bt -f 'bv*[height=360]+ba' $url
# youtube-dl --sub-lang en --write-auto-sub --sub-format srt --skip-download v0uYZ4rTOrk
# --write-sub --sub-lang en --skip-download URL
# https://www.youtube.com/watch?v=[YOUTUBE-VIDEO-ID]
# mpv ~/Video/temp/ *.mp4
# mv ~/Video/temp/*.* ~/Video
# ---------------------------------------
# download all channel!
# --------------------------------------
# Dmitry Bachilo channel example!
#
#    yt-dlp -f 'bv*[height>=360]+ba'
#    --embed-thumbnail --embed-metadata
#    --download-archive BachiloDmitry.txt
#    https://www.youtube.com/c/BachiloDmitry/videos -o '%(channel)s/%(title)s.%(ext)s'
#
#
echo "Done!"
mpv ~/Video/bt/*.mp4 --audio-file=~/Video/bt/*.m4a --sub-file=~/Video/bt/*.vtt
mv ~/Video/temp/*.* ~/Video
# nemo ~/Video
# --------------       MPV KEYB KEYS --------------------------------------
# https://www.linuxadictos.com/ru/mpv-%d1%88%d0%bf%d0%b0%d1%80%d0%b3%d0%b0%d0%bb%d0%ba%d0%b0-%d1%81-%d1%81%d0%be%d1%87%d0%b5%d1%82%d0%b0%d0%bd%d0%b8%d1%8f%d0%bc%d0%b8-%d0%ba%d0%bb%d0%b0%d0%b2%d0%b8%d1%88,-%d0%ba%d0%be%d1%82%d0%be%d1%80%d0%b0%d1%8f-%d0%bf%d1%80%d0%b5%d0%b2%d1%80%d0%b0%d1%82%d0%b8%d1%82-%d0%b2%d0%b0%d1%81-%d0%b2-%d0%bd%d0%b8%d0%bd%d0%b4%d0%b7%d1%8f-%d0%b2%d0%be%d1%81%d0%bf%d1%80%d0%be%d0%b8%d0%b7%d0%b2%d0%b5%d0%b4%d0%b5%d0%bd%d0%b8%d1%8f.html
#
#
# -------------------------------------------------------------------------

# yt-dlp --write-auto-sub --sub-format srt --sub-lang ru --skip-download --write-thumbnail -P ~/Video/temp -f 'bv*[height=360]+ba' https://www.youtube.com/watch?v=nyByDNQuMMI
