# Arch AUR Build

Build Arch Linux AUR packages in a container.

## How to build/create container

Within the repo with the `Containerfile`:

    podman build -t arch-aur-build .

## Build AUR packages and add to repo

The following command will download AUR package, build it and add it to the repo:

    podman run --rm -v /path/to/repos/myrepo/os/x86_64:/pkg arch-aur-build /bin/bash -c '/add -p <packagename> -r <reponame>'

## Remove package from repo

    podman run --rm -v /path/to/archlinux/repos/myrepo/os/x86_64:/pkg arch-aur-build /bin/bash -c '/remove -p <packagename>  -r <reponame>'

## Check AUR packages versions in repo and build new package if new version is available

    podman run --rm -v /path/to/archlinux/repos/myrepo/os/x86_64:/pkg arch-aur-build /bin/bash -c '/update -r <reponame>'

## Refresh repo

    podman run --rm -v /path/to/archlinux/repos/myrepo/os/x86_64:/pkg arch-aur-build /bin/bash -c '/refresh -r <reponame>'

## Compiled package location

The binary will be placed in the /pkg folder, which in the example above is
mounted to the current directory on the host. Change the owner:

    sudo chown -R www-data:www-data /path/to/archlinux/repos/myrepo/*

---

- Based on [archlinux/base](https://hub.docker.com/r/archlinux/base) image.
