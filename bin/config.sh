./os-create-config-drive --ssh-key /root/.ssh/id_rsa.pub --hostname centos --user-data /var/opt/libvirt/meta-data/user-data /var/opt/libvirt/meta-data/config.iso
cp -fa /var/opt/libvirt/image/CentOS-7-x86_64-GenericCloud-1707.qcow2 /var/opt/libvirt/vm/centos

