#
# Copyright (C) 2017 Chris Blake <chrisrblake93@gmail.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=hwmon-k10temp
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

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

EXTRA_KCONFIG:= \
	CONFIG_SENSORS_K10TEMP=m

define Build/Compile
	$(MAKE) -C "$(LINUX_DIR)" \
		$(KERNEL_MAKE_FLAGS) \
		SUBDIRS="$(PKG_BUILD_DIR)" \
		EXTRA_CFLAGS="$(BUILDFLAGS)" \
		modules
endef

$(eval $(call KernelPackage,hwmon-k10temp))
