#!/usr/bin/env bash

# Exit if no argument given.

if [ -z "$1" ]
then
  echo "Usage: `basename $0` <paths>"
  exit 1
fi
