#!/usr/bin/env bash
export PCDS_CONDA_VER=6.0.1
source /reg/g/pcds/pyps/conda/pcds_conda

THIS_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

pydm -m 'P=PLC:LAS:OPCPA:01' "${THIS_DIR}/home.ui"
echo "Running from: $PWD"
