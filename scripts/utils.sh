#!/bin/bash


copy_dir(){
  local package_source_dir=$1
  local package_install_dir=$2

  echo "Copy $package_source_dir to $package_install_dir"
  cp -R $package_source_dir/* $package_install_dir
  echo "dir copied!!"
}

copy_file(){
  local file_source_path=$1
  local file_target_path=$2
  
  echo "Copy $file_source_path to $file_target_path"
  cp $file_source_path $file_target_path
  echo "file copied!!"
}

command_exist(){
  local command_input=$1
  if ! command -v $command_input &> /dev/null
  then
    echo "$command_input could not be found"
    exit
  fi
}

