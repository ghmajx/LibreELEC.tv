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

PKG_NAME="libdrm"
PKG_VERSION="fde9773"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://dri.freedesktop.org"
PKG_URL="https://github.com/rockchip-linux/libdrm-rockchip/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="libdrm-rockchip-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain libpthread-stubs libpciaccess"
PKG_SECTION="graphics"
PKG_SHORTDESC="libdrm: Userspace interface to kernel DRM services"
PKG_LONGDESC="The userspace interface library to kernel DRM services."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--enable-largefile \
                           --disable-udev \
                           --disable-libkms \
                           --disable-intel \
                           --disable-radeon \
                           --disable-amdgpu \
                           --disable-nouveau \
                           --disable-vmwgfx \
                           --disable-freedreno \
                           --disable-vc4 \
                           --enable-rockchip-experimental-api \
                           --disable-install-test-programs \
                           --disable-cairo-tests \
                           --disable-manpages \
                           --disable-valgrind \
                           --with-kernel-source=$(kernel_path)"
