#!/bin/bash

git clone https://github.com/openvswitch/ovs.git

cd ovs

git checkout v3.3.2

./boot.sh

./configure

make
