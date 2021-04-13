#!/bin/bash


install_vim_package(){
  local package_source_dir=$1
  local package_install_dir=$2


  echo "Creating $package_install_dir local dir"
  mkdir -p $package_install_dir
  echo "Copy plug to local dir"
  cp -R $package_source_dir $package_install_dir
  echo "plug installed!!"
}

