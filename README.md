# karotz-openkarotz-allinone-installer

## What is this all about ?

This repo is an aggregate of various other git repos (with submodules) that allow you to take advantage of the latests bugfixes of the Openkarotz Firmware and Web applications and generate an unique *installable* USB Key.

## How does it work ?

This is an auto generation tool from sources for an "All in one" OpenKarotz installer

## How to init the project ?

Here are the steps:

- Add the git submodules:
  1. `git submodule add -b dev -f git@github.com:rofra/karotz-openkarotz-firmware.git firmware`
  1. `git submodule add -b dev -f git@github.com:rofra/karotz-openkarotz-websources-installer.git websources`
- Generate the full package with this command line: `sudo bash -x ./bin/makeallinstallerimage.sh` 
- Place all the files in *generatedimage/* directory in the root of your USB key 

## How to update the project ?

Use the command line `git submodule foreach git pull` to update the dependencies and regenerate the full package.

## Dependencies
You will need to find required dependencies for generating rootfs file and so on


## Resources

[http://www.openkarotz.org/](http://www.openkarotz.org/) : Openkarotz Project
