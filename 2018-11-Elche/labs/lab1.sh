# Lab 1: using vlc as a source an as a listener

echo "Killing all VLC instances (sources and listeners)"
killall vlc
sleep 1

echo "Creating the source"
cvlc ~/Videos/LBBB.ogv --sout "#duplicate{dst=http{dst=:8080/LBBB.ogv},dst=display}" --loop &
sleep 5

echo "Create two listeners"
cvlc http://localhost:8080/LBBB.ogv 2> /dev/null &
cvlc http://localhost:8080/LBBB.ogv 2> /dev/null &
