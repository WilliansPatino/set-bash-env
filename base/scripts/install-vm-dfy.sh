sudo virt-install \
--name dfy \
--description "Test VM with DragonFly" \
--ram=1024 \
--vcpus=1 \
--graphics vnc \
--cdrom /var/lib/libvirt/isos/dfly-x86_64-5.6.2_REL.iso \
--disk path=/var/lib/libvirt/images/dfy.img,bus=virtio,size=10 \
--network bridge:br0  \

