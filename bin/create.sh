virt-install \
  --name centos-install \
  --boot uefi \
  --memory 4096 \
  --vcpus 2 \
  --disk /var/opt/libvirt/vm/centos \
  --disk path=/var/opt/libvirt/meta-data/config.iso,device=cdrom \
  --import \
  --os-variant rhel7 \
  --network bridge:virbr0 \
  --noautoconsole \
  --panic default \
  --hostdev pci_0000_04_00_0 \
  --hostdev pci_0000_04_00_1
virsh console  centos-install
