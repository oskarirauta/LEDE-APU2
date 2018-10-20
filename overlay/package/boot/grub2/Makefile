#
# Copyright (C) 2006-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=grub
PKG_CPE_ID:=cpe:/a:gnu:grub2
PKG_VERSION:=2.02
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=@GNU/grub
PKG_HASH:=810b3798d316394f94096ec2797909dbf23c858e48f7b3830826b8daa06b7b0f

PKG_FIXUP:=autoreconf
HOST_BUILD_PARALLEL:=1
PKG_BUILD_DEPENDS:=grub2/host

PKG_SSP:=0

PKG_FLAGS:=nonshared

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/grub2
  CATEGORY:=Boot Loaders
  SECTION:=boot
  TITLE:=GRand Unified Bootloader
  URL:=http://www.gnu.org/software/grub/
  DEPENDS:=@TARGET_x86||TARGET_x86_64
endef

define Package/grub2-editenv
  CATEGORY:=Utilities
  SECTION:=utils
  SUBMENU:=Boot Loaders
  TITLE:=Grub2 Environment editor
  URL:=http://www.gnu.org/software/grub/
  DEPENDS:=@TARGET_x86||TARGET_x86_64
endef

define Package/grub2-editenv/description
	Edit grub2 environment files.
endef

HOST_BUILD_PREFIX := $(STAGING_DIR_HOST)

CONFIGURE_VARS += \
	grub_build_mkfont_excuse="don't want fonts"

CONFIGURE_ARGS += \
	--target=$(REAL_GNU_TARGET_NAME) \
	--disable-werror \
	--disable-nls \
	--disable-device-mapper \
	--disable-libzfs \
	--disable-grub-mkfont \
	--with-platform=none

HOST_CONFIGURE_VARS += \
	grub_build_mkfont_excuse="don't want fonts"

HOST_CONFIGURE_ARGS += \
	--disable-grub-mkfont \
	--target=$(REAL_GNU_TARGET_NAME) \
	--sbindir="$(STAGING_DIR_HOST)/bin" \
	--disable-werror \
	--disable-libzfs \
	--disable-nls

HOST_MAKE_FLAGS += \
	TARGET_RANLIB=$(TARGET_RANLIB) \
	LIBLZMA=$(STAGING_DIR_HOST)/lib/liblzma.a

define Host/Configure
	$(SED) 's,(RANLIB),(TARGET_RANLIB),' $(HOST_BUILD_DIR)/grub-core/Makefile.in
	$(Host/Configure/Default)
endef

define Package/grub2/install
	$(INSTALL_DIR) $(1)/etc/grub.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/00_header $(1)/etc/grub.d/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/10_linux $(1)/etc/grub.d/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/20_linux_xen $(1)/etc/grub.d/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/30_os-prober $(1)/etc/grub.d/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/40_custom $(1)/etc/grub.d/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/41_custom $(1)/etc/grub.d/
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/grub-file $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/grub-fstest $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/grub-glue-efi $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/grub-kbdcomp $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/grub-menulst2cfg $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/grub-mkimage $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/grub-mklayout $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/grub-mknetdir $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/grub-mkpasswd-pbkdf2 $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/grub-mkrelpath $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/grub-mkrescue $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/grub-mkstandalone $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/grub-render-label $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/grub-script-check $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/grub-syslinux2cfg $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/grub-bios-setup $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/grub-install $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/grub-macbless $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/grub-mkconfig $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/grub-ofpathname $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/grub-probe $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/grub-reboot $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/grub-set-default $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/grub-sparc64-setup $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/usr/share/grub
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/grub-mkconfig_lib $(1)/usr/share/grub/
endef

define Package/grub2-editenv/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/grub-editenv $(1)/usr/sbin/
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,grub2))
$(eval $(call BuildPackage,grub2-editenv))
