#!/bin/bash

export command_set="none"
if [ ${1} == "complete" ]; then
  export command_set="none"
elif [ ${1} == "without-partition-update" ]; then
  export command_set="--without-partition-update"
elif [ ${1} == "recursive" ]; then
  export command_set="--recursive-quicksort"
else
  export command_set="--reduced-operation-set"
fi

export stack=""
if [ ${2} == "True" ]; then
  export stack="--expose-stack"
else
  export stack="none"
fi

export train_errors=${3}

export output_dir_tb=${4}
export seed=${5}

export expose_pointers=""
if [ ${6} == "True" ]; then
  export expose_pointers="--do-not-expose-pointers-values"
else
  export expose_pointers="none"
fi


export result_name=${1}-${2}-${3}-${5}-${6}

qsub -V -N "$result_name" -q common_cpuQ train_model.sh
