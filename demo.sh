#!/bin/bash

if [[ ! -f ${FLAMY_HOME}/bin/flamy ]]; then
  echo 'Could not find ${FLAMY_HOME}/bin/flamy executable. Please make sure the environment variable FLAMY_HOME is correctly set.'
fi

$FLAMY_HOME/bin/flamy --config-file conf/flamy.properties shell

