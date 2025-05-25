# Recipe created by recipetool
# This is the basis of a recipe and may need further editing in order to be fully functional.
# (Feel free to remove these comments when editing.)

# Unable to find any files that looked like license statements. Check the accompanying
# documentation and source headers and set LICENSE and LIC_FILES_CHKSUM accordingly.
#
# NOTE: LICENSE is being set to "CLOSED" to allow you to at least start building - if
# this is not accurate with respect to the licensing of the software being built (it
# will not be in most cases) you must specify the correct value before using this
# recipe for anything other than initial testing/development!
LICENSE = "CLOSED"
LIC_FILES_CHKSUM = ""

SRC_URI = "git://github.com/chumoath/bmc_clid.git;protocol=https;branch=main"

# Modify these as desired
PV = "1.0+git"
SRCREV = "f4df98598faee04a31dfa81ade7e0356cfe0abc4"

S = "${WORKDIR}/git"

DEPENDS = "boost readline sdbusplus"

inherit cmake

# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
EXTRA_OECMAKE = ""

PACKAGES =+ "${PN}-lib ${PN}-generator ${PN}-plugin"

FILES:${PN} = "${bindir}/*"

FILES:${PN}-lib = "${libdir}/*.so*"

FILES:${PN}-generator = "${libdir}/bmc_clid/generator/*.so*"

FILES:${PN}-plugin = "${libdir}/bmc_clid/plugin/*.so*"

RDEPENDS:${PN} += "${PN}-lib ${PN}-generator ${PN}-plugin"
