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

PKG_NAME="mali-midgard-gbm"
PKG_VERSION="863a77f"
PKG_ARCH="arm aarch64"
PKG_LICENSE="nonfree"
PKG_SITE="https://developer.arm.com/products/software/mali-drivers/user-space"
PKG_URL="https://github.com/rockchip-linux/libmali/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="libmali-$PKG_VERSION*"
PKG_SECTION="graphics"
PKG_SHORTDESC="mali-midgard: OpenGL ES user-space binary for the ARM Mali Midgard GPU family"
PKG_LONGDESC="mali-midgard: OpenGL ES user-space binary for the ARM Mali Midgard GPU family"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

configure_target() {
 : # nothing todo
}

make_target() {
 : # nothing todo
}

makeinstall_target() {
  cd $ROOT/$PKG_BUILD

  mkdir -p $SYSROOT_PREFIX/usr/include
    cp -PRv include/EGL $SYSROOT_PREFIX/usr/include
    cp -PRv include/GLES $SYSROOT_PREFIX/usr/include
    cp -PRv include/GLES2 $SYSROOT_PREFIX/usr/include
    cp -PRv include/GLES3 $SYSROOT_PREFIX/usr/include
    cp -PRv include/KHR $SYSROOT_PREFIX/usr/include
    cp -PRv include/gbm.h $SYSROOT_PREFIX/usr/include

  mkdir -p $SYSROOT_PREFIX/usr/lib
    if [ "$DEVICE" = "TinkerBoard" ]; then
      cp -PRv lib/arm-linux-gnueabihf/libmali-midgard-r13p0-r0p0-gbm.so $SYSROOT_PREFIX/usr/lib
      ln -sf libmali-midgard-r13p0-r0p0-gbm.so $SYSROOT_PREFIX/usr/lib/libmali.so
    elif [ "$DEVICE" = "rk3328-box" ]; then
# should be: aarch64-linux-gnu/libmali-utgard-2th-r7p0-gbm.so
      cp -PRv lib/arm-linux-gnueabihf/lib32mali-utgard-2th-r7p0-gbm.so $SYSROOT_PREFIX/usr/lib
      ln -sf lib32mali-utgard-2th-r7p0-gbm.so $SYSROOT_PREFIX/usr/lib/libmali.so
    fi
    
    ln -sf libmali.so $SYSROOT_PREFIX/usr/lib/libEGL.so
    ln -sf libmali.so $SYSROOT_PREFIX/usr/lib/libGLESv2.so
    ln -sf libmali.so $SYSROOT_PREFIX/usr/lib/libgbm.so

  mkdir -p $SYSROOT_PREFIX/usr/lib/pkgconfig
    cp -PRv $PKG_DIR/pkgconfig/*.pc $SYSROOT_PREFIX/usr/lib/pkgconfig

echo "### >>> Omegamoon: Installing Mali in $INSTALL/usr/lib; device is $DEVICE"
  mkdir -p $INSTALL/usr/lib
    if [ "$DEVICE" = "TinkerBoard" ]; then
echo "### >>> Omegamoon: Installing Midgard Mali for $DEVICE"
      cp -PRv lib/arm-linux-gnueabihf/libmali-midgard-r13p0-r0p0-gbm.so $INSTALL/usr/lib
      ln -sf libmali-midgard-r13p0-r0p0-gbm.so $INSTALL/usr/lib/libmali.so
    elif [ "$DEVICE" = "rk3328-box" ]; then
echo "### >>> Omegamoon: Installing Utgard Mali for $DEVICE"
# should be: aarch64-linux-gnu/libmali-utgard-2th-r7p0-gbm.so
      cp -PRv lib/arm-linux-gnueabihf/lib32mali-utgard-2th-r7p0-gbm.so $INSTALL/usr/lib
      ln -sf lib32mali-utgard-2th-r7p0-gbm.so $INSTALL/usr/lib/libmali.so
    fi

    ln -sf libmali.so $INSTALL/usr/lib/libEGL.so
    ln -sf libmali.so $INSTALL/usr/lib/libGLESv2.so
    ln -sf libmali.so $INSTALL/usr/lib/libgbm.so
}
