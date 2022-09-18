# Arch AUR Build

Build Arch Linux AUR packages in a docker container.

## How to build/create container

Within the repo with the `Dockerfile`:

    docker build -t arch-aur-build .

## Build AUR packages and add to repo

The following command will download AUR package, build it and add it to the repo:

    docker run --rm -v /path/to/repos/myrepo/os/x86_64:/pkg arch-aur-build /bin/bash -c '/add <package>'

## Remove package from repo

    docker run --rm -v /path/to/archlinux/repos/myrepo/os/x86_64:/pkg arch-aur-build /bin/bash -c '/remove <package>'

## Check AUR packages versions in repo and build new package if new version available

    docker run --rm -v /path/to/archlinux/repos/myrepo/os/x86_64:/pkg arch-aur-build /bin/bash -c '/update'

## Refresh repo

    docker run --rm -v /path/to/archlinux/repos/myrepo/os/x86_64:/pkg arch-aur-build /bin/bash -c '/refresh'

## Compiled package location

The binary will be placed in the /pkg folder, which in the example above is
mounted to the current directory on the host. Change the owner:

    sudo chown -R www-data:www-data /path/to/archlinux/repos/myrepo/*

---

- Based on [archlinux/base](https://hub.docker.com/r/archlinux/base) image.
