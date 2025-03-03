
The purpose of this project is to provide container images that can be used to build and package software projects.


**planned characteristics:**

**OS flavors:**
* Fedora Linux
* Debian/Ubuntu Linux

*Language types:**

* C(gcc) and autotools/Cmake
* golang

variants:

* container image packaging
* rpm packaging
* deb packaging


**Example how to build a fedora based image for compiling C projects:**

```console

$ make  IMAGE_LANG=c IMAGE_OS=fedora REGISTRY_NAMESPACE=fillme image-build

```

**Example for using image `quay.io/fillme/devcontainer-fedora-c:latest`:**


````console

$ podman  run -it --workdir /work --mount type=bind,source=$(pwd),target=/work,relabel=private  --workdir /work quay.io/fillme/devcontainer/fedora-c:latest  bash  

```

prepuilt fedora-c images are available on [quay](https://quay.io/repository/madam/devcontainer/fedora-c).


