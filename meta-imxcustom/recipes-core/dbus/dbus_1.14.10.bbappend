FILESEXTRAPATHS:prepend := "${THISDIR}:"

SRC_URI += "file://0001-dbus-auth-anonymous.patch"

INSANE_SKIP:${PN} += "patch-status"
