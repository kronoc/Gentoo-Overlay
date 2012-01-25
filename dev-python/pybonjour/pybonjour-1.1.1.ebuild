# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils distutils
PYTHON_DEPEND="2"

DESCRIPTION="pybonjour provides a pure-Python interface to Apple Bonjour and
compatible DNS-SD libraries such as Avahi"
HOMEPAGE="http://code.google.com/p/pybonjour/"
SRC_URI="http://pybonjour.googlecode.com/files/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-python/setuptools net-dns/avahi"
RDEPEND=""

