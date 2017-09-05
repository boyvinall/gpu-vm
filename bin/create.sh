virt-install \
  --name win10-virt-install \
  --machine q35 \
  --boot uefi,hd,cdrom \
  --hvm \
  --memory 8192 \
  --vcpus 4 \
  --disk /var/opt/libvirt/vm/win10 \
  --disk /var/opt/libvirt/iso/SW_DVD5_Win_Pro_10_1607_64BIT_English_MLF_X21-06988.ISO,device=cdrom \
  --disk /usr/share/virtio-win/virtio-win.iso,device=cdrom \
  --disk path=/var/opt/libvirt/meta-data/config.iso,device=cdrom \
  --import \
  --os-variant rhel7 \
  --network bridge:virbr0 \
  --noautoconsole \
  --panic default \
  --hostdev pci_0000_04_00_0 \
  --hostdev pci_0000_04_00_1 \
  --print-xml
# virsh console  centos-install
