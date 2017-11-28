echo "Killing all VLC instances"
killall vlc
sleep 1

echo "Killing all user Icecast2 instances"
killall icecast2

echo "Run a second Icecast2 server listening at port 9000"
/usr/bin/icecast2 -b -c ~/icecast/icecast.xml
sleep 1

echo "Feed all icecast servers (2 movies for 8000 and 1 for 9000)"
cvlc ~/Videos/LBig_Buck_Bunny_small.ogv --sout "#std{access=shout,mux=ogg,dst=source:hackme@localhost:8000/BBB.ogv}" --loop &
sleep 1
cvlc ~/Videos/Lchi84_14_m4.ogv --sout "#std{access=shout,mux=ogg,dst=source:hackme@localhost:8000/chi.ogv}" --loop &
sleep 1
cvlc ~/Videos/Lhcil2003_01.ogv --sout "#std{access=shout,mux=ogg,dst=source:hackme@localhost:9000/hcil.ogv}" --loop &
sleep 1

#echo "Check the infrastructure"
#firefox http://localhost:8000 2> /dev/null &
#sleep 10
#firefox http://localhost:9000 2> /dev/null
#sleep 5

echo "Run a listener connected to the master Icecast server"
cvlc http://localhost:8000/BBB.ogv 2> /dev/null &
sleep 1

echo "Run a listener connected to the relay Icecast server"
cvlc http://localhost:9000/hcil.ogv 2> /dev/null &
sleep 1

echo "Create a P2PSP team"
xterm -e "~/P2PSP/p2psp-console/bin/splitter --source_addr 127.0.0.1 --source_port 8000 --splitter_port 8001 --channel BBBs.ogv --header_size 30000" &
sleep 1
xterm -e "~/P2PSP/p2psp-console/bin/monitor --splitter_addr 127.0.0.1 --splitter_port 8001" &
sleep 1
cvlc http://localhost:9999 & # Monitor's player
sleep 1
xterm -e "~/P2PSP/p2psp-console/bin/peer --splitter_addr 127.0.0.1 --splitter_port 8001 --player_port 10000" &
sleep 1
cvlc http://localhost:10000 & # The first peer

