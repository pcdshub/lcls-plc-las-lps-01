IOC_TOP=/reg/g/pcds/epics/ioc/common/ads-ioc/R0.5.0
IOC_INSTANCE_PATH := $(shell pwd)

# Set PRODUCTION_IOC to 1 to move from a testing to a production IOC:
PRODUCTION_IOC := 1

PROJECT_NAME := SLAC_OPCPA_EPS
PROJECT_PATH := ../../OPCPA_EPS/SLAC_OPCPA_EPS.tsproj
PLC := opcpa_lps_plc_01

PYTMC_OPTS := 
PREFIX := PLC:LAS:OPCPA:01

# With two $$, as in $$(IOC) below, this will be expanded in the
# environment of st.cmd:
DB_PARAMETERS := 'PREFIX=$(PREFIX),IOCNAME=$$(IOC),IOC=$$(IOC)'

include $(IOC_TOP)/iocBoot/templates/Makefile.base
