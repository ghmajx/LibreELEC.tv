#
# Copyright © 2017 Omegamoon
#
PKG_NAME="rk-opengl-mali-midgard"
PKG_VERSION="183e9ce"

# Omegamoon >> Add strace for debugging of Mali when needed
#PKG_DEPENDS_TARGET="toolchain strace"

# r13p0-00rel0 - Version as provided by Rockchip for use with DRM/X11 hard float
#   Current 4.4 mali kernel driver uses r13p0; be aware they should match the user space binaries
#   Uses internally: librt.so.1 libpthread.so.0 libm.so.6 libdl.so.2 
#                    libX11.so.6 libX11-xcb.so.1 libxcb.so.1 libxcb-dri2.so.0 
#                    libdrm.so.2
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libdrm libX11 libxcb libXrandr libXfixes libXext libXdamage"

PKG_REV="1"
PKG_ARCH="arm"
PKG_LICENSE="nonfree"
PKG_SITE="https://developer.arm.com/products/software/mali-drivers/user-space"

PKG_URL="https://github.com/omegamoon/$PKG_NAME/archive/$PKG_VERSION.tar.gz"

PKG_SOURCE_DIR="$PKG_NAME-$PKG_VERSION*"
PKG_SECTION="graphics"
PKG_SHORTDESC="rk-opengl-mali-midgard: OpenGL-ES and Mali driver for Mali Midgard GPUs"
PKG_LONGDESC="rk-opengl-mali-midgard: OpenGL-ES and Mali driver for Mali Midgard GPUs"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
 : # nothing todo
}

makeinstall_target() {
  mkdir -p $SYSROOT_PREFIX/usr/include
    cp -PR src/include/* $SYSROOT_PREFIX/usr/include

  mkdir -p $SYSROOT_PREFIX/usr/lib
    cp -PR src/lib/*.so* $SYSROOT_PREFIX/usr/lib
 
  mkdir -p $INSTALL/usr/lib
    cp -PR src/lib/*.so* $INSTALL/usr/lib
}

