#!/bin/sh

if [ -f  /.dockerenv ]
then
    echo "[!] Found Docker Environment File!";
    echo "[!] This system is running in a docker container";
    exit 0;
fi
if [ -f /.var/run/secrets/kubernetes.io ]
then
    echo "[!] Found kubernetes.io file" 
    echo "[!] This system is running in a kubernetes cluster";
    exit 0;
fi 

if grep -sq 'docker\|lxc' /proc/1/cgroup
then
    echo "[!] Running in Docker Environment!";
    exit 0;
else
    echo "[!] System is not running in a container";
fi

