#!/bin/bash
source ./utils.sh
echo "Checking software dependencies"
dependences=(node go ag java)

for dep in "${dependences[@]}"; do command_exist $dep; done

