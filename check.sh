set -eio pipefail
NODES=$(echo mrcd{01..04})
BLUE=$(tput setaf 4)
NOR=$(tput sgr0)

function info {
    echo -n $BLUE
    echo $@
    echo -n $NOR

}

function press_enter {
    info "Press enter to continue"
    read
}

info "Starting..."
info "Please run 'iperf -s' in another terminal"
press_enter

for node in $NODES
do
    #ssh $node host google.com
    ssh $node ping -c1 google.com
done

for node in $NODES
do
    ssh $node iperf -c merced-ib -t1
done
