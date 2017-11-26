echo "Killing all VLC instances (sources and listeners)"
killall vlc
sleep 1

echo "Creating the source"
cvlc ~/Videos/LBig_Buck_Bunny_small.ogv --sout "#duplicate{dst=http{dst=:8080/LBBB.ogv},dst=display}" --loop &
sleep 1

echo "Create two listeners"
cvlc http://localhost:8080/LBBB.ogv &
cvlc http://localhost:8080/LBBB.ogv &
