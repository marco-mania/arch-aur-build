# Arch AUR Build

Build Arch Linux AUR packages in a docker container.

## How to build/create container

Within the repo with the `Dockerfile`:

    sudo docker build -t arch-aur-build .

## Build AUR packages and add to repo

The following command will download AUR package and build it:

    sudo docker run --rm -v /path/to/repos/myrepo/os/x86_64:/pkg arch-aur-build /bin/bash -c '/add <package>'

Finally register package in the repo database:

    sudo docker run --rm -v /path/to/archlinux/repos/myrepo/os/x86_64:/pkg arch-aur-build /bin/bash -c '/refresh-repo'

## Remove package from repo

    sudo docker run --rm -v /path/to/archlinux/repos/myrepo/os/x86_64:/pkg arch-aur-build /bin/bash -c '/remove <package>'

## Check AUR packages versions in repo and build new package if new version available

    sudo docker run --rm -v /path/to/archlinux/repos/myrepo/os/x86_64:/pkg arch-aur-build /bin/bash -c '/update'

## Compiled package location

The binary will be placed in the /pkg folder, which in the example above is
mounted to the current directory on the host. Change the owner:

    sudo chown -R www-data:www-data /path/to/archlinux/repos/myrepo/*

---

- Based on [archlinux/base](https://hub.docker.com/r/archlinux/base) image.
