# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Language server for Odin."

HOMEPAGE="https://github.com/DanielGavin/ols"

SRC_URI="https://github.com/DanielGavin/ols/archive/refs/heads/master.tar.gz"

S="${WORKDIR}/ols-master"

LICENSE="MIT"

SLOT="0"

KEYWORDS="~amd64"

IUSE="odinfmt"

RDEPEND=""

DEPEND="${RDEPEND}"

BDEPEND="dev-lang/odin"

src_compile() {
	./build.sh || die "failed to build ols"
	if use odinfmt; then
		./odinfmt.sh || die "failed to build odinfmt"
	fi
}

src_install() {
	dobin ols
	if use odinfmt; then
		dobin odinfmt
	fi
}
