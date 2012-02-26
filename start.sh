#!/bin/bash

# Author: Chaz Lever
# Date:   02/26/2012
#
# Description:
# Script requires the imagesnap command line utility to capture images from
# your Mac's iSight camera. Runs imagesnap program in the background capturing
# snapshots every ${INTERVAL} seconds.

# Make sure images can be served
umask 022

INTERVAL=1
PID_FILE='imagesnap.pid'
IMG_PATH='images'

trap ctrl_c INT
function ctrl_c() {
  echo 'Cleaning images directory...'
  rm -f ${IMG_PATH}/*
  echo 'Stopping iSight...'
  cat ${PID_FILE} | xargs kill
  rm ${PID_FILE}
  exit
}

function start_webcam() {
  if [ -d ${IMG_PATH} ]; then
    rm -f ${IMG_PATH}/*
  else
    mkdir -p ${IMG_PATH}
  fi

  echo 'Starting iSight...'
  pushd ${IMG_PATH} &>/dev/null
  imagesnap -q -t ${INTERVAL} &
  PID=$!
  popd &>/dev/null
  echo ${PID} > ${PID_FILE}
}

function prune_images() {
  echo 'To stop use CTRL-C...'
  while :
  do
    # Try to keep around the last ${COUNT} snapshots
    COUNT=$(($(ls -U ${IMG_PATH} | wc -l) - 5))
    if [ ${COUNT} -gt 0 ]; then
      for fn in $(ls -U ${IMG_PATH} | head -n ${COUNT}); do
        rm ${IMG_PATH}/${fn}
      done
    fi
    sleep ${INTERVAL}
  done
}

start_webcam
prune_images
