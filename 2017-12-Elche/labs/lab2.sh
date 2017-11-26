echo "Killing all VLC instances (sources and listeners)"
killall vlc
sleep 1

echo "Create two sources"
cvlc ~/Videos/Big_Buck_Bunny_small.ogv --sout "#std{access=shout,mux=ogg,dst=source:hackme@localhost:8000/BBBs.ogv}" --loop &
sleep 1
cvlc ~/Videos/chi84_14_m4.ogv --sout "#std{access=shout,mux=ogg,dst=source:hackme@localhost:8000/LLL.ogv}" --loop &
sleep 1

echo "Check the infrastructure"
firefox http://localhost:8000 2> /dev/null &
sleep 5

echo "Create two listeners"
cvlc http://localhost:8000/BBBs.ogv 2> /dev/null &
cvlc http://localhost:8000/LLL.ogv 2> /dev/null &

