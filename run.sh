/usr/libexec/qemu-kvm \
    -enable-kvm \
    -M q35 \
    -m 8192 \
    -cpu host,kvm=off \
    -smp 4,sockets=1,cores=4,threads=1 \
    -device ioh3420,bus=pcie.0,addr=1c.0,multifunction=on,port=1,chassis=1,id=root.1 \
    -device vfio-pci,host=04:00.0,bus=root.1,addr=00.0,multifunction=on \
    -device vfio-pci,host=04:00.1,bus=root.1,addr=00.1 \
    -device virtio-scsi-pci \
    -drive file=/var/opt/libvirt/vm/win10,id=disk,format=raw,if=none -device scsi-hd,drive=disk \
    -drive file=/var/opt/libvirt/iso/SW_DVD5_Win_Pro_10_1607_64BIT_English_MLF_X21-06988.ISO,id=isocd,format=raw,if=none -device ide-cd,bus=ide.0,drive=isocd \
    -drive file=/usr/share/virtio-win/virtio-win.iso,id=virtiocd,format=raw,if=none -device ide-cd,bus=ide.1,drive=virtiocd \
    -boot order=dc \
    -netdev bridge,id=net0,br=virbr0 \
    -device virtio-net-pci,netdev=net0,mac=00:16:3e:00:01:01



    -drive if=pflash,format=raw,readonly,file=/usr/share/edk2.git/ovmf-x64/OVMF_CODE-pure-efi.fd \
    -drive if=pflash,format=raw,file=/tmp/vars.fd \



    -bios /usr/share/seabios.git/bios.bin \
    -device vfio-pci,host=04:00.0,bus=root.1,addr=00.0,multifunction=on,x-vga=on \
    -netdev type=tap,id=net0,ifname=tap0,vhost=on \
