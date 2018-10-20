#
# Copyright (C) 2006-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define KernelPackage/hwmon-k10temp
  SUBMENU:=Hardware Monitoring Support
  TITLE:=AMD Family 10h+ temperature sensor
  KCONFIG:=CONFIG_SENSORS_K10TEMP
  FILES:=$(LINUX_DIR)/drivers/hwmon/k10temp.ko
  AUTOLOAD:=$(call AutoLoad,60,k10temp)
  $(call AddDepends/hwmon,@PCI_SUPPORT @(x86||x86_64))
endef

define KernelPackage/hwmon-k10temp/description
 Thermal sensor support for AMD 10h, 11h, 12h (Llano), 14h (Brazos),
 15h (Bulldozer/Trinity/Kaveri) and 16h (Kabini/Mullins) CPUs
endef

$(eval $(call KernelPackage,hwmon-k10temp))
