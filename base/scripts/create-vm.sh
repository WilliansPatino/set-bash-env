sudo virt-install \
--virt-type=kvm \
--name dfy \
--description "Test VM with DragonFly" \
--ram=1024 \
--vcpus=1 \
--graphics vnc \
--cdrom /var/lib/libvirt/isos/dfly-x86_64-5.6.2_REL.iso \
--disk path=/var/lib/libvirt/images/dfy.qcow2,size=10 \
--network bridge:virbr0  \

