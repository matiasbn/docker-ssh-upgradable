#!/bin/bash
while IFS= read -r line; do
    set -- $line
    # echo "ssh -v -o StrictHostKeyChecking=no root@$1 -p 222 -i docker-key 'rpm -e --nodeps python'" | sh
    echo "sudo scp -i docker-key -v -o StrictHostKeyChecking=no -P 222 Python-2.7.16.tar root@$1:~" | sh
    echo "ssh -v -o StrictHostKeyChecking=no root@$1 -p 222 -i docker-key 'tar -xvf Python-2.7.16.tar'" | sh
    echo "ssh -v -o StrictHostKeyChecking=no root@$1 -p 222 -i docker-key 'cd Python-2.7.16 && ./configure --enable-optimizations && make altinstall && make install'" | sh
    # echo "ssh -v -o StrictHostKeyChecking=no root@$1 -p 222 -i docker-key 'rm -rf Python-2.7.16'" | sh
done < containers.txt