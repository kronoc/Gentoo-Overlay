# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

#inherit subversion
#inherit ruby

#ESVN_REPO_URI="http://paulbattley.googlecode.com/svn"
#ESVN_PROJECT="iplayer-dl"
SLOT="0"
SRC_URI="http://po-ru.com/files/iplayer-dl-latest.tar.gz"
DESCRIPTION="iplayer-dl"
HOMEPAGE="http://po-ru.com/projects/iplayer-downloader/"
IUSE="ruby"
KEYWORDS="~x86"
src_install() {
	cd "${S}"
	ruby setup.rb config
	ruby setup.rb install
}

