#!/usr/bin/env python3

import sys
import logging
from boto.utils import get_instance_identity
from taupage import configure_logging, get_config
from time import sleep
from boto.ec2 import elb


class ElbHealthChecker(object):
    INTERVAL = 10
    TIMEOUT = 300

    def __init__(self, region):
        configure_logging()
        self.logger = logging.getLogger(__name__)
        self.elb_client = elb.connect_to_region(region)

    def _get_elb_instance_state(self, instance_id: str, elb_name: str):
        result = self.elb_client.describe_instance_health(load_balancer_name=elb_name,
                                                          instances=[instance_id])
        state = result[0].state
        self.logger.debug("ELB state for instance {0}: {1}".format(instance_id, state))
        return state

    def is_in_service_from_elb_perspective(self, instance_id: str, elb_name: str):
        self.logger.info("Waiting for instance {0} to become healthy in elb {1}".format(instance_id, elb_name))

        for i in range(0, max(int(self.TIMEOUT / self.INTERVAL), 1)):
            state = self._get_elb_instance_state(instance_id, elb_name)
            if state == 'InService':
                self.logger.info("instance in service")
                return True
            else:
                self.logger.debug('waiting for instance')
                sleep(self.INTERVAL)

        self.logger.warning("timeout for in-service check exceeded")
        return False


if __name__ == '__main__':
    region = get_instance_identity()['document']['region']
    instance_id = get_instance_identity()['document']['instanceId']

    config = get_config()
    loadbalancer_name = config['healthcheck']['loadbalancer_name']

    healthchecker = ElbHealthChecker(region)
    is_in_service = healthchecker.is_in_service_from_elb_perspective(instance_id, loadbalancer_name)

    if is_in_service:
        sys.exit(0)
    else:

        sys.exit(1)
