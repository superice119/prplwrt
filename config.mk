
# OpenWrt SVN revision/branch/tag
# CONFIG_OPENWRT_PATH = branches/attitude_adjustment
# CONFIG_OPENWRT_REV  = 40431
OPENWRT_TAG   := v18.06.1

FEEDS_FILE 		:= prpl_feeds.conf

CONFIG_PACKAGES_LIST = juci rpcd

# Base configuration
CONFIG = \
	CONFIG_BUSYBOX_CONFIG_WATCHDOG=n \
	CONFIG_PACKAGE_watchdog=y \
	CONFIG_OWSD_USE_UBUS=y
