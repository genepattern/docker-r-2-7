#!/bin/sh

TASKLIB=$PWD/src
INPUT_FILE_DIRECTORIES=$PWD/data
S3_ROOT=s3://moduleiotest
WORKING_DIR=$PWD/job_1111


COMMAND_LINE="java -cp /build -DR_HOME=/usr/local/lib64/R -Dr_flags=/'--no-save --quiet --slave --no-restore/' RunR $TASKLIB/SurvivalCurve.R SurvivalCurve $INPUT_FILE_DIRECTORIES/surv.txt -c$INPUT_FILE_DIRECTORIES/surv.cls surv time censor -fcensor F  automatic -lt -lc 1 1 -m 0 1 log 0 T left-bottom"


echo "COMMAND IS " $COMMAND_LINE

RHOME=/packages/R-2.7.2/

# note the crazy escaping of the quote string to get the rflags passed without being broken up by either docker or the script inside the container


# ##### NEW PART FOR SCRIPT INSTEAD OF COMMAND LINE ################################
# Make the input file directory since we need to put the script to execute in it
mkdir -p $WORKING_DIR
mkdir -p $WORKING_DIR/.gp_metadata
EXEC_SHELL=$WORKING_DIR/.gp_metadata/local_exec.sh

echo "#!/bin/bash\n" > $EXEC_SHELL
echo " R --version \n" >$EXEC_SHELL

echo $COMMAND_LINE >>$EXEC_SHELL
echo "\n " >>$EXEC_SHELL

chmod a+x $EXEC_SHELL


REMOTE_COMMAND="runLocal.sh $TASKLIB $INPUT_FILE_DIRECTORIES $S3_ROOT $WORKING_DIR $EXEC_SHELL"

docker run -v $TASKLIB:$TASKLIB -v $INPUT_FILE_DIRECTORIES:$INPUT_FILE_DIRECTORIES -v $WORKING_DIR:$WORKING_DIR  genepattern/docker-r-2-7 $REMOTE_COMMAND

#echo $REMOTE_COMMAND
#docker run -v $TASKLIB:$TASKLIB -v $INPUT_FILE_DIRECTORIES:$INPUT_FILE_DIRECTORIES -v $WORKING_DIR:$WORKING_DIR -it  liefeld/r27  bash
