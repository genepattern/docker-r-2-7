#!/bin/sh

TASKLIB=$PWD/src
INPUT_FILE_DIRECTORIES=$PWD/data
S3_ROOT=s3://moduleiotest
WORKING_DIR=$PWD/job_1111

#RHOME=/packages/R-2.7.2/
RHOME=/usr/local/lib64/R

COMMAND_LINE="java -cp /build -DR_suppress=true -DR_HOME=$RHOME -Dr_flags=\"--no-save --quiet --slave --no-restore\" RunR $TASKLIB/hello.R hello"

DOCKER_CONTAINER=genepattern/docker-r-2-7

# aws batch only vars 
S3_ROOT=s3://moduleiotest
JOB_QUEUE=TedTest
JOB_DEFINITION_NAME="R27_Generic"
JOB_ID=gp_job_R27_helloWorld_$1




