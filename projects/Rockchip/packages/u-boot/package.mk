################################################################################
#      This file is part of LibreELEC - https://libreelec.tv
#      Copyright (C) 2017 Team LibreELEC
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="u-boot"
if [ "$DEVICE" = "rk3328-box" ]; then
  # branch rkproduct
  PKG_VERSION="8adeb23"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET gcc-linaro-aarch64-elf:host gcc-linaro-arm-eabi:host"
else
  PKG_VERSION="15b7a3d"
fi
PKG_ARCH="arm"
PKG_LICENSE="GPL"
PKG_SITE="http://www.denx.de/wiki/U-Boot"
PKG_URL="https://github.com/rockchip-linux/u-boot/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="u-boot-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain dtc:host"
PKG_SECTION="tools"
PKG_SHORTDESC="u-boot: Universal Bootloader project"
PKG_LONGDESC="Das U-Boot is a cross-platform bootloader for embedded systems, used as the default boot loader by several board vendors. It is intended to be easy to port and to debug, and runs on many supported architectures, including PPC, ARM, MIPS, x86, m68k, NIOS, and Microblaze."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_configure_target() {
  if [ -z "$UBOOT_CONFIG" ]; then
    echo "Please add UBOOT_CONFIG to your project or device options file, aborting."
    exit 1
  fi
}

make_target() {
  if [ "$DEVICE" = "rk3328-box" ]; then
    export PATH=$ROOT/$TOOLCHAIN/lib/gcc-linaro-aarch64-elf/bin/:$ROOT/$TOOLCHAIN/lib/gcc-linaro-arm-eabi/bin/:$PATH
    CROSS_COMPILE=aarch64-elf- ARCH=arm CFLAGS="" LDFLAGS="" make mrproper
    CROSS_COMPILE=aarch64-elf- ARCH=arm CFLAGS="" LDFLAGS="" make $UBOOT_CONFIG
    CROSS_COMPILE=aarch64-elf- ARCH=arm CFLAGS="" LDFLAGS="" make ARCHV=aarch64 HOSTCC="$HOST_CC" HOSTSTRIP="true"
  else
    CROSS_COMPILE="$TARGET_PREFIX" CFLAGS="" LDFLAGS="" ARCH=arm make mrproper
    CROSS_COMPILE="$TARGET_PREFIX" CFLAGS="" LDFLAGS="" ARCH=arm make $UBOOT_CONFIG
    CROSS_COMPILE="$TARGET_PREFIX" CFLAGS="" LDFLAGS="" ARCH=arm make HOSTCC="$HOST_CC" HOSTSTRIP="true"
  fi
}

makeinstall_target() {
  if [ "$DEVICE" = "TinkerBoard" ]; then
    tools/mkimage \
      -n rk3288 \
      -T rksd \
      -d spl/u-boot-spl-dtb.bin \
      u-boot.rockchip
  
    cat u-boot-dtb.bin >> u-boot.rockchip

    mkdir -p $INSTALL/usr/share/bootloader
      cp -PRv u-boot.rockchip $INSTALL/usr/share/bootloader
      cp -PRv $PKG_DIR/scripts/update.sh $INSTALL/usr/share/bootloader
  elif [ "$DEVICE" = "rk3328-box" ]; then
    mkdir -p $INSTALL/usr/share/bootloader
      cp -PRv uboot.img $INSTALL/usr/share/bootloader/u-boot.rockchip
      # cp -PRv trust.img $INSTALL/usr/share/bootloader
      cp -PRv $PKG_DIR/scripts/update.sh $INSTALL/usr/share/bootloader
  fi
}
