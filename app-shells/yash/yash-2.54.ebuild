# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
PLOCALES="en ja"

inherit flag-o-matic plocale toolchain-funcs

DESCRIPTION="Yash is a POSIX-compliant command line shell"
HOMEPAGE="https://yash.osdn.jp/"
SRC_URI="mirror://sourceforge.jp/${PN}/78345/${P}.tar.xz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="nls test"
RESTRICT="!test? ( test )"

RDEPEND="sys-libs/ncurses:=
	nls? ( virtual/libintl )"
DEPEND="${RDEPEND}"
BDEPEND="nls? ( sys-devel/gettext )
	test? ( sys-apps/ed )"

src_configure() {
	append-cflags -std=c99

	sh ./configure \
		--prefix="${EPREFIX}"/usr \
		--exec-prefix="${EPREFIX}" \
		$(use_enable nls) \
		CC="$(tc-getCC)" \
		LINGUAS="$(plocale_get_locales | sed "s/en/en@quot en@boldquot/")" \
		|| die
}
