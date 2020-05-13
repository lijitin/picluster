#!/bin/bash
echo "Starting loggers on all the pis."
parallel-ssh -h ~/phosts '/exports/scripts/resource_logger/log_sys_resource.sh >/dev/null 2>&1'
