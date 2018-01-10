#!/bin/bash

java -cp /build -DR_suppress=true -DR_HOME=/usr/local/lib64/R -Dr_flags="--no-save --quiet --slave --no-restore" RunR /Users/liefeld/GenePattern/gp_dev/docker/docker-r-2-7/tests/helloWorld/src/hello.R hello

 
