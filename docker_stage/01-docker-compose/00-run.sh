# install compose services
install -m 755 files/docker-compose-loader.sh "${ROOTFS_DIR}/usr/local/bin/"
install -m 644 files/docker-compose-loader.service "${ROOTFS_DIR}/etc/systemd/system/"

# enable compose loader
on_chroot << EOF
systemctl enable docker-compose-loader
EOF