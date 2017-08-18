#!/bin/bash

java -cp /build -DR_HOME=/packages/R-2.7.2/ -Dr_flags="--no-save --quiet --slave --no-restore" RunR /Users/liefeld/GenePattern/gp_dev/docker/docker-r-2-7/tests/helloWorld/src/hello.R hello

 
