set -x
function label {
    video=$1

    if [[ ! -e ~/Videos/L$video.ogv ]]; then
	ffmpeg -i ~/Videos/$video.ogv \
	       -vf "drawtext=text='%{pts\:hms}': x=(w-tw)/2: y=h-(2*lh): fontcolor=white: box=1: boxcolor=0x00000000@1" \
	       -codec:v libtheora \
	       -codec:a libvorbis \
	       ~/Videos/L${video}.ogv
    else
	echo "Video ~/Videos/$video.ogv already exists :-)"
    fi
}

label Big_Buck_Bunny_small
label chi84_14_m4
label hcil2003_01
set +x

