rsync -avz "$@" --exclude=mnt --exclude=.git ./ root@cn:/var/opt/libvirt/
