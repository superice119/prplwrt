
# (C) 2013-2014 CarrierWrt.org

#
# Product profile: router (Consumer Wi-Fi Router)
#

define Product/router

	CONFIG += \
		CONFIG_PACKAGE_uhttpd=n \
		CONFIG_PACKAGE_luci=n \
		CONFIG_PACKAGE_owsd=y \
		CONFIG_PACKAGE_juci=y \
		CONFIG_PACKAGE_juci-dnsmasq-dhcp=y \
		CONFIG_PACKAGE_juci-dropbear=y \
		CONFIG_PACKAGE_juci-event=y \
		CONFIG_PACKAGE_juci-firewall-fw3=y \
		CONFIG_PACKAGE_juci-mod-system=y \
		CONFIG_PACKAGE_juci-mwan3=y \
		CONFIG_PACKAGE_juci-network-device=y \
		CONFIG_PACKAGE_juci-network-dsl=y \
		CONFIG_PACKAGE_juci-network-netifd=y \
		CONFIG_PACKAGE_juci-qos=y \
		CONFIG_PACKAGE_juci-realtime-graphs=y \
		CONFIG_PACKAGE_juci-usb=y \
		CONFIG_PACKAGE_juci-wireless=y \
		CONFIG_PACKAGE_juci-theme-prpl=y \
		CONFIG_PACKAGE_prpl-demo-utils=y
endef

define Customization/default

	CONFIG += \
		CONFIG_PACKAGE_luci-theme-bootstrap=n \
		CONFIG_PACKAGE_luci-branding=n
	
	TESTED := \
		ar71xx/openwrt-ar71xx-generic-tl-wr841nd-v5-squashfs-factory.bin \
		ar71xx/openwrt-ar71xx-generic-tl-wr841nd-v5-squashfs-sysupgrade.bin \
		ar71xx/openwrt-ar71xx-generic-tl-wr841n-v8-squashfs-factory.bin \
		ar71xx/openwrt-ar71xx-generic-tl-wr841n-v8-squashfs-sysupgrade.bin \
		ar71xx/openwrt-ar71xx-generic-tl-wr941nd-v2-squashfs-factory.bin \
		ar71xx/openwrt-ar71xx-generic-tl-wr941nd-v2-squashfs-sysupgrade.bin \
		ar71xx/openwrt-ar71xx-generic-tl-wr2543-v1-squashfs-factory.bin \
		ar71xx/openwrt-ar71xx-generic-tl-wr2543-v1-squashfs-sysupgrade.bin \
		ar71xx/openwrt-ar71xx-generic-tl-wdr4300-v1-squashfs-factory.bin \
		ar71xx/openwrt-ar71xx-generic-tl-wdr4300-v1-squashfs-sysupgrade.bin \
		ar71xx/openwrt-ar71xx-generic-wndr3700v2-squashfs-factory.bin \
		ar71xx/openwrt-ar71xx-generic-wndr3700v2-squashfs-sysupgrade.bin \
		ar71xx/openwrt-ar71xx-generic-ubnt-airrouter-squashfs-factory.bin \
		ar71xx/openwrt-ar71xx-generic-ubnt-airrouter-squashfs-sysupgrade.bin

endef

# define Customization/debug
# 	$(call Customization/default)

# 	CONFIG += \
# 		CONFIG_BUSYBOX_CONFIG_FEATURE_INIT_COREDUMPS=y \
# 		CONFIG_PACKAGE_ATH_DEBUG=y \
# 		CONFIG_PACKAGE_hostapd-utils=y

# 	LOG_MIGR_DIR := $(OPENWRT_DIR)/files/etc/uci-migrations/1.1.3-8
# endef

# define Customization/debug/prebuild
# 	touch $(OPENWRT_DIR)/files/.init_enable_core
# 	# rm $(LOG_MIGR_DIR)/01-log-set-level-info.sh
# 	# cp common/uci-migrations/log/set-level-debug.sh $(LOG_MIGR_DIR)/01-log-set-level-debug.sh
# endef

#define Customization/managed
	#$(call Customization/default)

	# CONFIG += \
		# CONFIG_PACKAGE_easycwmp=y

	# TR69_MIGR_DIR := $(OPENWRT_DIR)/files/etc/uci-migrations/1.1.3-6
#endef

#define Customization/managed/prebuild
	# mkdir -p $(TR69_MIGR_DIR)
	# cp common/uci-migrations/tr69/set-fixed-acs.sh $(TR69_MIGR_DIR)/01-tr69-set-fixed-acs.sh
	# cp common/uci-migrations/tr69/open-firewall.sh $(TR69_MIGR_DIR)/02-tr69-open-firewall.sh
	# cp common/uci-migrations/tr69/fixup-wan-if.sh  $(TR69_MIGR_DIR)/03-tr69-fixup-wan-if.sh
#endef
