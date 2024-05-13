#!/bin/bash
#===============================================
git clone https://github.com/kenzok8/openwrt-packages.git package/openwrt-packages

git clone https://github.com/kenzok8/luci-theme-ifit.git package/lean/luci-theme-ifit

# Modify default IP
sed -i 's/192.168.1.1/192.168.1.251/g' openwrt/package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-ifit/g' feeds/luci/collections/luci/Makefile

sed -i 's/\/bin\/ash/\/bin\/bash/' package/base-files/files/etc/passwd

# Modify hostname
sed -i 's/OpenWrt/aoaoji/g' package/base-files/files/bin/config_generate

#2. Custom settings
sed -i 's?zstd$?zstd ucl upx\n$(curdir)/upx/compile := $(curdir)/ucl/compile?g' tools/Makefile
#sed -i 's/$(TARGET_DIR)) install/$(TARGET_DIR)) install --force-overwrite/' package/Makefile
#sed -i 's/root:.*/root:$1$tTPCBw1t$ldzfp37h5lSpO9VXk4uUE\/:18336:0:99999:7:::/g' package/base-files/files/etc/shadow
