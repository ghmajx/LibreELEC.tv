#
# Copyright © 2017 Omegamoon
#

PKG_NAME="xf86-video-armsoc"
PKG_VERSION="068e417"
PKG_REV="1"
PKG_ARCH="arm"
PKG_LICENSE="OSS"
PKG_SITE="git://anongit.freedesktop.org/xorg/driver/xf86-video-armsoc"

PKG_URL="https://github.com/omegamoon/xf86-video-armsoc/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="$PKG_NAME-$PKG_VERSION*"

PKG_DEPENDS_TARGET="toolchain libX11 xorg-server xextproto"
PKG_SECTION="x11/driver"
PKG_SHORTDESC="xf86-video-armsoc - X.org graphics driver for ARM graphics"
PKG_LONGDESC="Generic DDX driver with DRI2 support for ARM SoCs which expose a DRM/KMS interface"

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--with-xorg-module-dir=$XORG_PATH_MODULES"

post_makeinstall_target() {
  mkdir -p $INSTALL/etc/X11
    cp $PKG_DIR/config/*.conf $INSTALL/etc/X11
}
