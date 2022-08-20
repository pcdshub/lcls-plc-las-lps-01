#!/usr/bin/env bash
source /reg/g/pcds/pyps/conda/pcds_conda
pydm -m 'P=PLC:LAS:OPCPA:01' /reg/g/pcds/epics-dev/payers/lcls-plc-las-lps-01/opcpa-lps-screens/home.ui
echo "Running from: $PWD"
