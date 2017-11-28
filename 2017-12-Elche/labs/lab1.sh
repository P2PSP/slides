echo "Killing all VLC instances (sources and listeners)"
killall vlc
sleep 1

echo "Creating the source"
cvlc ~/Videos/LBig_Buck_Bunny_small.ogv --sout "#duplicate{dst=http{dst=:8080/BBB.ogv},dst=display}" --loop &
sleep 5

echo "Create two listeners"
cvlc http://localhost:8080/BBB.ogv 2> /dev/null &
cvlc http://localhost:8080/BBB.ogv 2> /dev/null &
