sudo virt-install \
--name pin \
--description "Test PinguyOS" \
--ram=1024 \
--vcpus=1 \
--graphics vnc \
--cdrom /var/lib/libvirt/isos/Pinguy_OS_18.04.2_Mini-LTS_x86-64.iso \
--disk path=/var/lib/libvirt/images/pin.qcow2,bus=virtio,size=10 \
--network bridge:br0  \

