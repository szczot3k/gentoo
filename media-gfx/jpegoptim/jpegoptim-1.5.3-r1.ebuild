# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Utility to optimize JPEG files"
HOMEPAGE="https://www.kokkonen.net/tjko/projects.html"
SRC_URI="https://www.kokkonen.net/tjko/src/${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux ~ppc-macos"

RDEPEND="media-libs/libjpeg-turbo:="
DEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DUSE_MOZJPEG=no
	)

	cmake_src_configure
}

src_install() {
	# lacks an install target with cmake
	dobin "${BUILD_DIR}"/${PN}
	doman ${PN}.1
	einstalldocs
}
