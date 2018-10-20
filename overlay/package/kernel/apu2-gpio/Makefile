#
# Copyright (C) 2017 Chris Blake <chrisrblake93@gmail.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=apu2-gpio
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define KernelPackage/apu2-gpio
  SUBMENU:=LED modules
  TITLE:=APU2/3 extra gpio support
  KCONFIG:=CONFIG_GPIO_APU
  FILES:=$(LINUX_DIR)/drivers/gpio/gpio-apu.ko
  AUTOLOAD:=$(call AutoLoad,80,gpio-apu)
  DEPENDS:=@TARGET_x86||TARGET_x86_64 @GPIO_SUPPORT
endef

define KernelPackage/apu2-gpio/description
  Extra support for apu2/3 gpios.
endef

EXTRA_KCONFIG:= \
	CONFIG_GPIO_APU=m

define Build/Compile
	$(MAKE) -C "$(LINUX_DIR)" \
		$(KERNEL_MAKE_FLAGS) \
		SUBDIRS="$(PKG_BUILD_DIR)" \
		EXTRA_CFLAGS="$(BUILDFLAGS)" \
		modules
endef

$(eval $(call KernelPackage,apu2-gpio))
