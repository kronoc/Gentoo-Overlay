# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit webapp eutils depend.php

DESCRIPTION="bbPress php and mysql based forum system."
HOMEPAGE="http://bbpress.org/"
#SRC_URI="http://bbpress.org/${P}.tar.gz"
SRC_URI="http://bbpress.org/latest.tar.gz"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~hppa ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

S="${WORKDIR}/${PN}"

need_php

pkg_setup() {
	webapp_pkg_setup

	require_php_with_any_use mysql mysqli
	require_php_with_use pcre
}

src_install() {
	local docs="license.txt readme.html"

	webapp_src_preinst

	einfo "Installing main files"
	cp bb-config-sample.php bb-config.php
	cp -r * "${D}${MY_HTDOCSDIR}"
	einfo "Done"

	ewarn "                                                            "
	ewarn "Please make sure you have register_globals = off set in your"
	ewarn "/etc/apache2/php.ini file                                   "
	ewarn "If this is not an option for your web server and you NEED it"
	ewarn "set to on, then insert the following in your WordPress      "
	ewarn ".htaccess file:                                             "
	ewarn "php_flag register_globals off                               "
	ewarn "                                                            "

	ewarn "                                                            "
	ewarn "From this point, you will need to edit your    "
	ewarn "config.php file in $DocumentRoot/bbpress/ and point to "
	ewarn "your database. Once this is done, you can log in to         "
	ewarn "bbpress at http://localhost/bbpress                     "
	ewarn "                                                            "

	ewarn "                                                            "
	ewarn "If you are upgrading from a previous version BACK UP your   "
	ewarn "database.  Once you are done with that, browse to           "
	ewarn "http://localhost/bbpress/bb-admin/upgrade.php and follow  "
	ewarn "the instructions on the screen.                             "
	ewarn "                                                            "

	# handle documentation files
	#
	# NOTE that doc files go into /usr/share/doc as normal; they do NOT
	# get installed per vhost!

	dodoc "${docs}"
	for doc in "${docs}" INSTALL; do
		rm -f "${doc}"
	done

	# Identify the configuration files that this app uses
	# User can want to make changes to these!
	webapp_serverowned "${MY_HTDOCSDIR}/index.php"
	#webapp_serverowned "${MY_HTDOCSDIR}/my-templates/"
	webapp_serverowned "${MY_HTDOCSDIR}"
	webapp_configfile  "${MY_HTDOCSDIR}/bb-config.php"

	# now strut stuff
	webapp_src_install
}
