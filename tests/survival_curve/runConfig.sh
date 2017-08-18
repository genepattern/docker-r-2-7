#!/bin/sh

TASKLIB=$PWD/src
INPUT_FILE_DIRECTORIES=$PWD/data
S3_ROOT=s3://moduleiotest
WORKING_DIR=$PWD/job_1111

RHOME=/packages/R-2.7.2/


COMMAND_LINE="java -cp /build -DR_HOME=/packages/R-2.7.2/ -Dr_flags=\"--no-save --quiet --slave --no-restore\" RunR $TASKLIB/SurvivalCurve.R SurvivalCurve surv.txt -c surv.cls surv time censor -fcls.clinical F automatic -lt -lc 1 1 -m 0 1 log 0 T left-bottom"

DOCKER_CONTAINER=genepattern/docker-r-2-7

# aws batch only vars 
S3_ROOT=s3://moduleiotest
JOB_QUEUE=TedTest
JOB_DEFINITION_NAME="R27_Generic"
JOB_ID=gp_job_R27_helloWorld_$1




