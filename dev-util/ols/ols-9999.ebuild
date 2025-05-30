# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Language server for Odin."

HOMEPAGE="https://github.com/DanielGavin/ols"

EGIT_REPO_URI="https://github.com/DanielGavin/ols.git"
EGIT_BRANCH="master"

LICENSE="MIT"

SLOT="0"

KEYWORDS="~amd64"

RDEPEND=""

DEPEND="${RDEPEND}"

BDEPEND="dev-lang/odin"

src_prepare() {
	default
}

src_compile() {
	./build.sh || die "failed to build ols"
	./odinfmt.sh || die "failed to build odinfmt"
}

src_install() {
	dobin ols
	dobin odinfmt
}
