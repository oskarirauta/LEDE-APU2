# OpenWRT-APU3

Bringup repo for the PC Engines APU3 on OpenWRT!

Currently based on OpenWRT Nightlies. This repo will provide you with an example board profile and make config to help assist in building, but is not required.
Adds missing drivers and few extra packages.

Some ingredients were merged with LEDE, but when they combined, parts went lost, for example hwmon-k10temp kernel module.
Repository also enables grub package for target and adds some tools to get you started.

**NOTE:** This repo is not actively maintained.

Building
-----
#### Build Only
`./build.sh`

#### Modify Configs and Build
`./build.sh modify`
