#!/bin/bash

#restart rsyslog because we upload new config file in our setup process
service rsyslog restart

#TODO First check if this is really necessary
service docker restart
