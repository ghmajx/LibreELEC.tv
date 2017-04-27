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

PKG_NAME="rkmpp"
PKG_VERSION="for_linux"
PKG_ARCH="any"
PKG_LICENSE="APL"
PKG_SITE="https://github.com/rockchip-linux/mpp"
PKG_URL="https://github.com/rockchip-linux/mpp/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="mpp-${PKG_VERSION}*"
PKG_DEPENDS_TARGET="toolchain libdrm"
PKG_SECTION="multimedia"
PKG_SHORTDESC="rkmpp: RockChip Media Process Platform (MPP) module"
PKG_LONGDESC="rkmpp: RockChip Media Process Platform (MPP) module"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CMAKE_OPTS_TARGET="-DRKPLATFORM=ON \
                       -DHAVE_H264D=ON \
                       -DHAVE_H265D=ON \
                       -DHAVE_MPEG2D=ON \
                       -DHAVE_MPEG4D=ON \
                       -DHAVE_VP8D=ON \
                       -DHAVE_JPEGD=ON \
                       -DHAVE_DRM=ON"

unpack() {
  rm -rf $BUILD/$PKG_NAME-$PKG_VERSION
  git clone --depth 1 --branch $PKG_VERSION https://github.com/rockchip-linux/mpp.git $BUILD/$PKG_NAME-$PKG_VERSION
}
