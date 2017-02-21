#
# Copyright © 2017 Omegamoon
#

PKG_NAME="rockchip-tools"
PKG_VERSION="40c2d2d"
PKG_ARCH="arm"

PKG_LICENSE="GPL"
PKG_SITE="http://rockchip.wikidot.com/"

PKG_URL="https://github.com/omegamoon/$PKG_NAME/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="$PKG_NAME-$PKG_VERSION*"

PKG_DEPENDS_TARGET=""
PKG_SECTION="tools"
PKG_SHORTDESC="Rockchip tools"
PKG_LONGDESC="Various Rockchip related tools"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  : # nothing
}

makeinstall_target() {
  : # install from image script
}

post_unpack() {
  ( cd $BUILD
    ln -sv $PKG_NAME-$PKG_VERSION $PKG_NAME
  )
}
