virsh destroy centos
virsh undefine centos

virsh destroy centos-install
virsh undefine centos-install

sed -i '/192.168.122/d' /root/.ssh/known_hosts