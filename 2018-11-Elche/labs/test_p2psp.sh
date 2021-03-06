# Testing P2PSP

echo "Killing all VLC instances (sources and listeners)"
killall vlc
sleep 1

echo "Creating a source (note, Icecast must be running)"
cvlc ~/Videos/LBBB.ogv --sout "#std{access=shout,mux=ogg,dst=source:hackme@localhost:8000/LBBB.ogv}" --loop &
sleep 5

export adapter_IP_addr=`ip route get 8.8.8.8 | head -1 | cut -d ' ' -f 7`

echo "Create a P2PSP team"
xterm -e "python3 ~/P2PSP/simulator/src/splitter_video.py --source_address $adapter_IP_addr --source_port 8000 --channel LBBB.ogv --splitter_port 8001 --header_chunks 30" &
sleep 1
xterm -e "python3 ~/P2PSP/simulator/src/monitor_video.py --splitter_address $adapter_IP_addr  --splitter_port 8001" &
sleep 1
ffplay http://localhost:9999 & # Monitor's player
sleep 1
xterm -e "python3 ~/P2PSP/simulator/src/peer_video.py --splitter_address $adapter_IP_addr --splitter_port 8001 --player_port 10000" &
sleep 1
ffplay http://localhost:10000 & # The first peer

