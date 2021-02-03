#!/bin/bash

sudo yum -y install https://www.elrepo.org/elrepo-release-7.0-5.el7.elrepo.noarch.rpm
sudo rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
sudo yum --disablerepo="*" --enablerepo="elrepo-kernel" list available | grep kernel-lt
sudo yum --enablerepo=elrepo-kernel install kernel-lt

sudo yum -y --enablerepo=elrepo-kernel install kernel-lt-{devel,headers,perf}
sudo grub2-set-default 0
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
sudo reboot
