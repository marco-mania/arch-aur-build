FROM docker.io/archlinux:latest

RUN pacman -Syu --noconfirm --needed base base-devel git curl jq zstd && \
    useradd -d /home/builder builder && \
    mkdir -p /home/builder/{.config/pacman,.gnupg,out} && \
    echo 'MAKEFLAGS="-j$(nproc)"' >> /home/builder/.config/pacman/makepkg.conf && \
    echo 'PKGDEST="/home/builder/out"' >> /home/builder/.config/pacman/makepkg.conf && \
    echo 'keyserver-options auto-key-retrieve' > /home/builder/.gnupg/gpg.conf && \
    chown -R builder:users /home/builder && \
    echo '[multilib]' >> /etc/pacman.conf && \
    echo 'Include = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf

VOLUME /pkg /build

COPY sudoers /etc/sudoers
COPY add remove update refresh /
