# install packages
yum -y install sysstat psmisc lvm2 pmm-client https://repo.percona.com/yum/percona-release-latest.noarch.rpm
yum install -y ansible
yum install -y unzip 
yum -y install percona-toolkit

# add user and group
#groupadd -g 1099 mongo
#useradd -u 1098 -g 1099 -M -d /mongo/data -s /bin/false mongo

# disable THP
tee /etc/systemd/system/disable-transparent-huge-pages.service <<EOF
[Unit]
Description=Disable Transparent Huge Pages (THP)
DefaultDependencies=no
After=sysinit.target local-fs.target
Before=mongod.service

[Service]
Type=oneshot
ExecStart=/bin/sh -c 'echo never | tee /sys/kernel/mm/transparent_hugepage/enabled > /dev/null'

[Install]
WantedBy=basic.target
EOF

systemctl daemon-reload
systemctl start disable-transparent-huge-pages
systemctl enable disable-transparent-huge-pages

mkdir /etc/tuned/virtual-guest-no-thp

tee /etc/tuned/virtual-guest-no-thp/tuned.conf <<EOF
[main]
include=virtual-guest

[vm]
transparent_hugepages=never
EOF

tuned-adm profile virtual-guest-no-thp

# create the dedicated volume (except for mongos servers)
if [[ $(hostname -s) != *mongos* ]]
then
    parted /dev/sdb mklabel gpt --script
    parted /dev/sdb mkpart /mongodb 0% 100% --script
    pvcreate /dev/sdb1
    vgcreate mongovg /dev/sdb1
    lvcreate -l 85%FREE --name mongolv mongovg
    mkfs.xfs -L mongodb /dev/mongovg/mongolv
    echo "$(blkid /dev/mongovg/mongolv | awk ' { print $3 }' | tr -d '"') /mongodb        xfs defaults,noatime 1 1" | tee -a /etc/fstab
    parted /dev/sdc mklabel gpt --script
    parted /dev/sdc mkpart /logs 0% 100% --script
    pvcreate /dev/sdc1
    vgcreate logsvg /dev/sdc1
    lvcreate -l 80%FREE --name logslv logsvg
    mkfs.xfs -L mongodb /dev/logsvg/logslv
    echo "$(blkid /dev/logsvg/logslv | awk ' { print $3 }' | tr -d '"') /logsdrive        xfs defaults,noatime 1 1" | tee -a /etc/fstab
fi


# increase file limits
tee -a /etc/security/limits.d/20-nproc.conf <<EOF
*        hard   nofile    64000
*        soft    nofile    64000
EOF

tee -a /etc/pam.d/login <<EOF
session    required    pam_limits.so
EOF

# tune kernel params
sysctl vm.swappiness=1
sysctl vm.dirty_ratio=15
sysctl vm.dirty_background_ratio=5

tee -a  /etc/sysctl.conf <<EOF
vm.swappiness=1
vm.dirty_ratio=15
vm.dirty_background_ratio=5
EOF

