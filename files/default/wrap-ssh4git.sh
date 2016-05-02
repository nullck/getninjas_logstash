#!/usr/bin/env bash
/usr/bin/env ssh -o "StrictHostKeyChecking=no" -i "/home/deployer/.ssh/id_rsa" $1 $2
