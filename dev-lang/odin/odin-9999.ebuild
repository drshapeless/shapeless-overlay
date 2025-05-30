# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LLVM_COMPAT=(14 17 18 19 20)
inherit llvm-r1 git-r3

DESCRIPTION="The Data-Oriented Language for Sane Software Development."

HOMEPAGE="https://odin-lang.org/"

EGIT_REPO_URI="https://github.com/odin-lang/Odin.git"
EGIT_BRANCH="master"

LICENSE="BSD"

SLOT="0"

KEYWORDS="~amd64"

RDEPEND="
$(llvm_gen_dep '
llvm-core/clang:${LLVM_SLOT}=
llvm-core/llvm:${LLVM_SLOT}=
')
"

DEPEND="${RDEPEND}"

CPPFLAGS=""
CXXFLAGS=""

src_prepare() {
	default
}

src_compile() {
	./build_odin.sh release || die "failed to build odin"
}

src_install() {
	insinto usr/lib/odin
	exeinto usr/lib/odin

	doexe odin
	doins -r base core vendor
	dosym -r /usr/lib/odin/odin /usr/bin/odin
}
