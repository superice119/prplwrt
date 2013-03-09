
# (C) 2013 CarrierWrt.org

#
# Target: ar71xx
#

define Target/ar71xx

  CONFIG += \
    CONFIG_TARGET_ar71xx=y \
    CONFIG_TARGET_ROOTFS_JFFS2=n

  IMAGES = \
    ar71xx/openwrt-ar71xx-generic-tl-wr941nd-v2-squashfs-factory.bin \
    ar71xx/openwrt-ar71xx-generic-tl-wr941nd-v2-squashfs-sysupgrade.bin

endef

ALL_TARGETS += ar71xx
