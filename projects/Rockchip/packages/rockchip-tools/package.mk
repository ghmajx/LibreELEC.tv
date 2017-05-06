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
