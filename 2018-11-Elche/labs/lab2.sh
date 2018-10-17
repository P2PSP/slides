# Lab 2: Using Icecast as a streaming server

set -x

echo "Killing all VLC instances (sources and listeners)"
killall vlc
sleep 1

echo "Create two sources"
#cvlc ~/Videos/LBig_Buck_Bunny_small.ogv --sout "#duplicate{dst=std{access=shout,mux=ogg,dst=source:hackme@localhost:8000/BBB.ogv},dst=display}" --loop &
cvlc ~/Videos/LBBB.ogv --sout "#std{access=shout,mux=ogg,dst=source:hackme@localhost:8000/LBBB.ogv}" --loop &
sleep 1
#cvlc  ~/Videos/Lchi84_14_m4.ogv --sout "#duplicate{dst=std{access=shout,mux=ogg,dst=source:hackme@localhost:8000/chi.ogv},dst=display}" --loop &
cvlc ~/Videos/Lchi84_14_m4.ogv --sout "#std{access=shout,mux=ogg,dst=source:hackme@localhost:8000/Lchi.ogv}" --loop &
sleep 1

echo "Check the infrastructure"
firefox http://localhost:8000 2> /dev/null &
sleep 5

echo "Create three listeners"
cvlc http://localhost:8000/LBBB.ogv 2> /dev/null &
cvlc http://localhost:8000/LBBB.ogv 2> /dev/null &
cvlc http://localhost:8000/Lchi.ogv 2> /dev/null &

set +x
