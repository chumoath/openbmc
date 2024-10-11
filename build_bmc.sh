#!/bin/sh

mv build/qemuarm64.bmc build/qemuarm64

. setup qemuarm64

bitbake rust-llvm-native
bitbake rust-native
bitbake bmcweb
bitbake webui-vue
bitbake net-snmp
bitbake phosphor-certificate-manager
bitbake phosphor-hwmon
bitbake phosphor-fan
bitbake phosphor-objmgr
bitbake phosphor-health-monitor
bitbake obmc-ikvm
bitbake phosphor-led-sysfs
bitbake telemetry
bitbake entity-manager
bitbake phosphor-network
bitbake obmc-phosphor-power
bitbake phosphor-settings-manager
bitbake phosphor-inventory-manager
bitbake phosphor-led-manager
bitbake phosphor-user-manager
bitbake phosphor-debug-collector
bitbake phosphor-software-manager
bitbake phosphor-state-manager
bitbake obmc-phosphor-image


bitbake package-index


mv build/qemuarm64 build/qemuarm64.bmc


# bitbake -c clean obmc-phosphor-image
# bitbake-layers show-recipes | grep image
# oe-pkgdata-browser
# oe-pkgdata-util



# apt install apache2

# echo src/gz all http://192.168.39.45/ipk/all                     >>    /etc/opkg/server.conf
# echo src/gz cortexa57 http://192.168.39.45/ipk/cortexa57         >>    /etc/opkg/server.conf
# echo src/gz qemuarm64 http://192.168.39.45/ipk/qemuarm64         >>    /etc/opkg/server.conf

# qemu-system-aarch64 \
# -net nic -net user,hostfwd=:127.0.0.1:3222-:22,hostfwd=:127.0.0.1:3443-:443,hostfwd=udp:127.0.0.1:3623-:623,hostfwd=udp:127.0.0.1:12345-:12345,hostname=qemu \
# -object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0 \
# -drive id=disk0,file=obmc-phosphor-image-qemuarm64.ext4,if=none,format=raw \
# -device virtio-blk-pci,drive=disk0 \
# -device qemu-xhci -device usb-tablet \
# -device usb-kbd  -machine virt \
# -cpu cortex-a57 -smp 4 -m 256 -device virtio-gpu-pci  \
# -kernel Image \
# -append "root=/dev/vda rw" \
# -serial mon:stdio


#systemctl mask reboot.target
#systemctl unmask reboot.target


# sed -i 's/eth0/enp0s1/g' /usr/share/ipmi-providers/channel_config.json


# d-feet      tcp:host=127.0.0.1,port=12345
# socat TCP-LISTEN:12345,fork UNIX-CONNECT:/var/run/dbus/system_bus_socket
