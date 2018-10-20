# Lab 4: hybrid approach

echo "Killing all VLC instances"
killall vlc
sleep 1

echo "Killing all user Icecast2 instances"
killall icecast2

echo "Run a second Icecast2 server listening at port 9000"
/usr/bin/icecast2 -b -c ~/icecast/icecast.xml
sleep 1

echo "Feed all icecast servers (2 movies for 8000 and 1 for 9000)"
cvlc ~/Videos/LBBB.ogv --sout "#std{access=shout,mux=ogg,dst=source:hackme@localhost:8000/LBBB.ogv}" --loop &
sleep 1
cvlc ~/Videos/Lchi84_14_m4.ogv --sout "#std{access=shout,mux=ogg,dst=source:hackme@localhost:8000/Lchi.ogv}" --loop &
sleep 1
cvlc ~/Videos/Lhcil2003_01.ogv --sout "#std{access=shout,mux=ogg,dst=source:hackme@localhost:9000/Lhcil.ogv}" --loop &
sleep 1

#echo "Check the infrastructure"
#firefox http://localhost:8000 2> /dev/null &
#sleep 10
#firefox http://localhost:9000 2> /dev/null
#sleep 5

echo "Run a listener connected to the master Icecast server"
cvlc http://localhost:8000/LBBB.ogv 2> /dev/null &
sleep 1

echo "Run a listener connected to the relay Icecast server"
cvlc http://localhost:9000/Lhcil.ogv 2> /dev/null &
sleep 1

echo "Create a P2PSP team"
xterm -e "python ~/P2PSP/simulator/src/splitter_video.py" &
sleep 1
adapter_IP_addr=`ip route get 8.8.8.8 | head -1 | cut -d ' ' -f 7`
xterm -e "python ~/P2PSP/simulator/src/monitor_video.py --splitter_address $adapter_IP_addr --splitter_port 8001" &
sleep 1
cvlc http://localhost:9999 & # Monitor's player
sleep 1
xterm -e "python ~/P2PSP/simulator/src/peer_video.py --splitter_addess $adapter_IP_addr  --splitter_port 8001 --player_port 10000" &
sleep 1
cvlc http://localhost:10000 & # The first peer

