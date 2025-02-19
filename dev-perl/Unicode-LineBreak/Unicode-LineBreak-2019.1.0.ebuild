# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DIST_AUTHOR=NEZUMI
DIST_VERSION=2019.001

inherit perl-module

DESCRIPTION="UAX #14 Unicode Line Breaking Algorithm"

SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~loong ~m68k ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~amd64-linux ~x86-linux ~arm64-macos ~ppc-macos ~x64-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

RDEPEND="dev-perl/MIME-Charset
	virtual/perl-Encode"
DEPEND="${RDEPEND}"
PERL_RM_FILES=("t/pod.t")
