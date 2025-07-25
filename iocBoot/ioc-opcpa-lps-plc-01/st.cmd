#!/reg/g/pcds/epics/ioc/common/ads-ioc/R0.6.1/bin/rhel7-x86_64/adsIoc
################### AUTO-GENERATED DO NOT EDIT ###################
#
#         Project: SLAC_OPCPA_EPS.tsproj
#        PLC name: opcpa_lps_plc_01 (opcpa_lps_plc_01 Instance)
# Generated using: pytmc 2.17.0
# Project version: 644ade0
#    Project hash: 644ade012c173ee9f9935180f7b347c570f525c0
#     PLC IP/host: 172.21.160.250
#      PLC Net ID: 172.21.160.250.1.1
#  ** Production mode IOC **
#  Using /cds/data/iocData for autosave and archiver settings.
#
# Libraries:
#
#   Tc2_BABasic: * -> 3.1.1.0 (Beckhoff Automation GmbH)
#   Tc2_EtherCAT: * -> 3.3.12.0 (Beckhoff Automation GmbH)
#   Tc2_ModbusRTU: * -> 3.4.2.0 (Beckhoff Automation GmbH)
#   Tc2_Standard: * -> 3.3.2.0 (Beckhoff Automation GmbH)
#   Tc2_System: * -> 3.4.24.0 (Beckhoff Automation GmbH)
#   Tc3_Module: * -> 3.3.21.0 (Beckhoff Automation GmbH)
#
################### AUTO-GENERATED DO NOT EDIT ###################
< envPaths

epicsEnvSet("ADS_IOC_TOP", "$(TOP)" )

epicsEnvSet("ENGINEER", "aberges" )
epicsEnvSet("LOCATION", "PLC:LAS:OPCPA:01" )
epicsEnvSet("IOCSH_PS1", "$(IOC)> " )
epicsEnvSet("ACF_FILE", "$(ADS_IOC_TOP)/iocBoot/templates/unrestricted.acf")

# Run common startup commands for linux soft IOC's
< /reg/d/iocCommon/All/pre_linux.cmd

# Register all support components
dbLoadDatabase("$(ADS_IOC_TOP)/dbd/adsIoc.dbd")
adsIoc_registerRecordDeviceDriver(pdbbase)

epicsEnvSet("ASYN_PORT",        "ASYN_PLC")
epicsEnvSet("IPADDR",           "172.21.160.250")
epicsEnvSet("AMSID",            "172.21.160.250.1.1")
epicsEnvSet("AMS_PORT",         "851")
epicsEnvSet("ADS_MAX_PARAMS",   "1181")
epicsEnvSet("ADS_SAMPLE_MS",    "50")
epicsEnvSet("ADS_MAX_DELAY_MS", "100")
epicsEnvSet("ADS_TIMEOUT_MS",   "1000")
epicsEnvSet("ADS_TIME_SOURCE",  "0")

# Add a route to the PLC automatically:
system("${ADS_IOC_TOP}/scripts/add_route.sh 172.21.160.250 ^172.*")

# adsAsynPortDriverConfigure(portName, ipaddr, amsaddr, amsport,
#    asynParamTableSize, priority, noAutoConnect, defaultSampleTimeMS,
#    maxDelayTimeMS, adsTimeoutMS, defaultTimeSource)
# portName            Asyn port name
# ipAddr              IP address of PLC
# amsaddr             AMS Address of PLC
# amsport             Default AMS port in PLC (851 for first PLC)
# paramTableSize      Maximum parameter/variable count. (1000)
# priority            Asyn priority (0)
# noAutoConnect       Enable auto connect (0=enabled)
# defaultSampleTimeMS Default sample of variable (PLC ams router
#                     checks if variable changed, if changed then add to send buffer) (50ms)
# maxDelayTimeMS      Maximum delay before variable that has changed is sent to client
#                     (Linux). The variable can also be sent sooner if the ams router
#                     send buffer is filled (100ms)
# adsTimeoutMS        Timeout for adslib commands (1000ms)
# defaultTimeSource   Default time stamp source of changed variable (PLC=0):
#                     PLC=0: The PLC time stamp from when the value was
#                         changed is used and set as timestamp in the EPICS record
#                         (if record TSE field is set to -2=enable asyn timestamp).
#                         This is the preferred setting.
#                     EPICS=1: The time stamp will be made when the updated data
#                         arrives in the EPICS client.
adsAsynPortDriverConfigure("$(ASYN_PORT)", "$(IPADDR)", "$(AMSID)", "$(AMS_PORT)", "$(ADS_MAX_PARAMS)", 0, 0, "$(ADS_SAMPLE_MS)", "$(ADS_MAX_DELAY_MS)", "$(ADS_TIMEOUT_MS)", "$(ADS_TIME_SOURCE)")

cd "$(ADS_IOC_TOP)/db"


dbLoadRecords("iocSoft.db", "IOC=PLC:LAS:OPCPA:01")
dbLoadRecords("save_restoreStatus.db", "P=PLC:LAS:OPCPA:01:")
dbLoadRecords("caPutLog.db", "IOC=$(IOC)")

## TwinCAT task, application, and project information databases ##
dbLoadRecords("TwinCAT_TaskInfo.db", "PORT=$(ASYN_PORT),PREFIX=PLC:LAS:OPCPA:01,IDX=1")
dbLoadRecords("TwinCAT_AppInfo.db", "PORT=$(ASYN_PORT), PREFIX=PLC:LAS:OPCPA:01")

dbLoadRecords("TwinCAT_Project.db", "PREFIX=PLC:LAS:OPCPA:01,PROJECT=SLAC_OPCPA_EPS.tsproj,HASH=644ade0,VERSION=644ade0,PYTMC=2.17.0,PLC_HOST=172.21.160.250")

#   Tc2_BABasic: * -> 3.1.1.0 (Beckhoff Automation GmbH)
dbLoadRecords("TwinCAT_Dependency.db", "PREFIX=PLC:LAS:OPCPA:01,DEPENDENCY=Tc2_BABasic,VERSION=3.1.1.0,VENDOR=Beckhoff Automation GmbH")
#   Tc2_EtherCAT: * -> 3.3.12.0 (Beckhoff Automation GmbH)
dbLoadRecords("TwinCAT_Dependency.db", "PREFIX=PLC:LAS:OPCPA:01,DEPENDENCY=Tc2_EtherCAT,VERSION=3.3.12.0,VENDOR=Beckhoff Automation GmbH")
#   Tc2_ModbusRTU: * -> 3.4.2.0 (Beckhoff Automation GmbH)
dbLoadRecords("TwinCAT_Dependency.db", "PREFIX=PLC:LAS:OPCPA:01,DEPENDENCY=Tc2_ModbusRTU,VERSION=3.4.2.0,VENDOR=Beckhoff Automation GmbH")
#   Tc2_Standard: * -> 3.3.2.0 (Beckhoff Automation GmbH)
dbLoadRecords("TwinCAT_Dependency.db", "PREFIX=PLC:LAS:OPCPA:01,DEPENDENCY=Tc2_Standard,VERSION=3.3.2.0,VENDOR=Beckhoff Automation GmbH")
#   Tc2_System: * -> 3.4.24.0 (Beckhoff Automation GmbH)
dbLoadRecords("TwinCAT_Dependency.db", "PREFIX=PLC:LAS:OPCPA:01,DEPENDENCY=Tc2_System,VERSION=3.4.24.0,VENDOR=Beckhoff Automation GmbH")
#   Tc3_Module: * -> 3.3.21.0 (Beckhoff Automation GmbH)
dbLoadRecords("TwinCAT_Dependency.db", "PREFIX=PLC:LAS:OPCPA:01,DEPENDENCY=Tc3_Module,VERSION=3.3.21.0,VENDOR=Beckhoff Automation GmbH")

cd "$(IOC_TOP)"

## PLC Project Database files ##
dbLoadRecords("opcpa_lps_plc_01.db", "PORT=$(ASYN_PORT),PREFIX=PLC:LAS:OPCPA:01,IOCNAME=$(IOC),IOC=$(IOC)")

# Total records: 181
callbackSetQueueSize(2362)

# Autosave and archive settings:
save_restoreSet_status_prefix("PLC:LAS:OPCPA:01:")
save_restoreSet_IncompleteSetsOk(1)
save_restoreSet_DatedBackupFiles(1)
set_pass0_restoreFile("info_positions.sav")
set_pass1_restoreFile("info_settings.sav")

# ** Production IOC Settings **
set_savefile_path("$(IOC_DATA)/$(IOC)/autosave")
set_requestfile_path("$(IOC_DATA)/$(IOC)/autosave")

# Production IOC autosave files go in iocData:
cd "$(IOC_DATA)/$(IOC)/autosave"

# Create info_positions.req and info_settings.req
makeAutosaveFiles()

cd "$(IOC_DATA)/$(IOC)/archive"

# Create $(IOC).archive
makeArchiveFromDbInfo("$(IOC).archive", "archive")
cd "$(IOC_TOP)"

# Configure access security: this is required for caPutLog.
asSetFilename("$(ACF_FILE)")

# Initialize the IOC and start processing records
iocInit()

# Enable logging
iocLogInit()

# Configure and start the caPutLogger after iocInit
epicsEnvSet(EPICS_AS_PUT_LOG_PV, "$(IOC):caPutLog:Last")

# caPutLogInit("HOST:PORT", config)
# config options:
#       caPutLogNone       -1: no logging (disable)
#       caPutLogOnChange    0: log only on value change
#       caPutLogAll         1: log all puts
#       caPutLogAllNoFilter 2: log all puts no filtering on same PV
caPutLogInit("$(EPICS_CAPUTLOG_HOST):$(EPICS_CAPUTLOG_PORT)", 0)

# Start autosave backups
create_monitor_set( "info_positions.req", 10, "" )
create_monitor_set( "info_settings.req", 60, "" )

# All IOCs should dump some common info after initial startup.
< /reg/d/iocCommon/All/post_linux.cmd

