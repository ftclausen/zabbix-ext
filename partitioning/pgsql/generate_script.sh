#!/bin/sh

BASE_DIR=$(dirname $0)
if [ $BASE_DIR = '.' ] 
then
  BASE_DIR=$PWD
fi

. $BASE_DIR/env.sh

$DB_QUERY_TOOL -U $DB_USER -w -f $SCRIPT_GENERATE_SCRIPT 2> $SCRIPT_ZABBIX_CONVERTION_SCRIPT_TEMP

awk -F "NOTICE:" '/NOTICE:/ {print $2}' $SCRIPT_ZABBIX_CONVERTION_SCRIPT_TEMP | sed 's/^[ \t]*//g' | tee $SCRIPT_ZABBIX_CONVERTION_SCRIPT ; rm -f $SCRIPT_ZABBIX_CONVERTION_SCRIPT_TEMP
