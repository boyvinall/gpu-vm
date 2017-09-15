#!/bin/bash
# small test script to create GPU VMs on openstack

GPU=${1:-gtx1080}
# IMAGE=CentOS-7-x86_64-GenericCloud-1707
IMAGE=ubuntu-16.04-x86_64

# <instance>
function os_delete() {
  [ -f .$1 ] && (
      id=$(cat .$1 | gawk '$2 == "id"     { print $4 }')
      [ -n "$id" ] && openstack server delete $id
      rm -f .$1
  )
}

# <instance> <image> <flavor> <ip>
function os_create() {
  FLAVOR_ID=$(openstack flavor list -f json | jq -r ".[] | select(.Name == \"$3\") | .ID")
  echo FLAVOR_ID $FLAVOR_ID
  openstack server create --image $2 --flavor $FLAVOR_ID --network demo-net --key-name my-key $1 | tee .$1
  while true; do
    echo -n .
    id=$(cat .$1     | gawk '$2 == "id"     { print $4 }')
    status=$(cat .$1 | gawk '$2 == "status" { print $4 }')
    if [ $status != BUILD ]; then break; fi
    sleep 1
    openstack server show $id > .$1
  done
  if [ $status != ERROR ]; then
    cat .$1
    openstack server add floating ip $id $4
  else
    fault=$(cat .$1 | gawk '$2 == "fault" { print $4 }')
    echo $fault
  fi
}

# <instance> <image> <flavor> <ip>
function os_recreate() {
  os_delete $1
  ssh-keygen -R $4
  os_create $1 $2 $3 $4
}

# os_recreate foo cirros m1.tiny 10.44.96.57
# os_recreate gpu-one  $IMAGE-GPU m1.medium.$GPU 10.44.96.70
# os_recreate gpu-both $IMAGE     m1.medium.$GPU 10.44.96.80
# os_recreate win-gpu  win10-gpu  m1.medium.$GPU  10.44.96.61
# os_recreate win-gpu  win10-gpu  m1.medium.$GPU  10.44.96.61
os_recreate win  win10-bokken  m1.large  10.44.96.54
# os_recreate ubuntu-q35 ubuntu-16.04-x86_64-q35 m1.medium 10.44.96.59
wait