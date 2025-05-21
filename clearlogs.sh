#!/bin/bash
# dns check
# Version 1.1
# Written by A Kehlert
# SAMPLE: for i in a b; do for k in {XXX..XXX}; do ssh psX0X$i-$k.txl sudo ipmitool sel clear

for i in a b; do for k in {380..389}; do ssh ps601$i-$k.txl sudo ipmitool sel clear; done; done;