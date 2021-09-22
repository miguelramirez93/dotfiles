#!/bin/bash
folders_to_create=(Desktop Documents Downloads Music Pictures Public Templates Videos)
echo "Creating folders"
for folder in "${folders_to_create[@]}"; do mkdir -p /mnt/data/$folder; done

echo "Removing home folders"
for folder in "${folders_to_create[@]}"; do rm -rf $HOME/$folder; done

echo "Creating syslinks"
for folder in "${folders_to_create[@]}"; do ln -s /mnt/data/$folder $HOME/$folder; done
