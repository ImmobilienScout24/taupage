#!/bin/bash

set -x

newrelic_yaml=/opt/proprietary/newrelic/newrelic.yml

#check if there is a no_newrelic file and exit
if [ ! -d /opt/proprietary/newrelic ]; then
	echo "INFO: no NewRelic agent found, skip configuration"
else

	# standard config files
	newrelic_agents="
	/opt/proprietary/newrelic"

	############################
	# CHANGE DEFAULT YAML FILE #
	############################

	echo "INFO: change default newrelic.yaml"

	#set high security
	sed -i "1,$ s/high_security:.*$/high_security:\ false/" $newrelic_yaml

	#change my application
	sed -i "1,$ s/app_name:.*$/app_name:\ APPNAME/" $newrelic_yaml

	#TODO maybe change more default settings
fi
