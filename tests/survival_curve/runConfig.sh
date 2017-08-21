#!/bin/sh

TASKLIB=$PWD/src
INPUT_FILE_DIRECTORIES=$PWD/data
S3_ROOT=s3://moduleiotest
WORKING_DIR=$PWD/job_1111

R_HOME=/usr/local/lib64/R


COMMAND_LINE="java -cp /build -DR_HOME=$R_HOME -Dr_flags=/'--quiet --no-save --slave/' RunR $TASKLIB/SurvivalCurve.R SurvivalCurve $INPUT_FILE_DIRECTORIES/surv.txt -c$INPUT_FILE_DIRECTORIES/surv.cls surv time censor -fcensor F  automatic -lt -lc 1 1 -m 0 1 log 0 T left-bottom"

DOCKER_CONTAINER=genepattern/docker-r-2-7

# aws batch only vars 
S3_ROOT=s3://moduleiotest
JOB_QUEUE=TedTest
JOB_DEFINITION_NAME="R27_Generic"
JOB_ID=gp_job_R27_SurvivalCurve_$1




