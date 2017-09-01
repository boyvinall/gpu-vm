virt-install \
  --name centos \
  --memory 2048 \
  --vcpus 2 \
  --disk /var/opt/libvirt/vm/centos \
  --disk path=/var/opt/libvirt/meta-data/config.iso,device=cdrom \
  --import \
  --os-variant rhel7 \
  --network bridge:virbr0 \
  --noautoconsole
