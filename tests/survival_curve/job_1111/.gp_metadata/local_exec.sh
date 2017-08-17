#!/bin/bash

java -cp /build -DR_HOME=/packages/R-2.7.2/ -Dr_flags="--no-save --quiet --slave --no-restore" RunR /Users/liefeld/GenePattern/gp_dev/docker/docker-r-2-7/tests/survival_curve/src/SurvivalCurve.R SurvivalCurve surv.txt -c surv.cls surv time censor -fcls.clinical F automatic -lt -lc 1 1 -m 0 1 log 0 T left-bottom

 
