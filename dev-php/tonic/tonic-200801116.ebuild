# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

HOMEPAGE="http://tonic.sourceforge.net/"
SRC_URI="mirror://sourceforge/tonic/tonic-20080116.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_install() {
	elog "Installing program"
	insinto /usr/share/php5/tonic
	doins -r tonic/*
}
pkg_postinst() {
	ewarn "Installed to /usr/share/php5"
}

