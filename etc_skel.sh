#!/bin/bash

for f in /etc/skel/{.bashrc,.profile,.bash_logout} ;
do
    touch $f
    sed -i.orig '1s;^;umask 077;' $f
done

cat >> /etc/skel/.bashrc <<-EOF
    umask 077
    . /mnt/ketita/software/linux/include.bashrc
    . /mnt/ketita/software/linux/bash_aliases
    umask 077
EOF

cat >> /etc/skel/.profile <<-EOF
    umask 077
    . /mnt/ketita/software/linux/include.bash_profile
    umask 077
EOF

cat >> /etc/skel/.profile <<-EOF
    umask 077
    . /mnt/ketita/software/linux/include.bash_logout
    umask 077
EOF
