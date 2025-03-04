
The purpose of this project is to provide container images that can be used to build and package software projects.


**planned characteristics:**

**OS flavors:**
* Fedora Linux
* Debian/Ubuntu Linux

*Language types:**

* C(gcc) and autotools/Cmake
* golang

**variants:**

* container image packaging
* rpm packaging
* deb packaging


Of these, only the C language images on fedora, debian, and ubuntu are   implemented yet.


**Example how to build and publisha fedora based image for compiling C projects:**

```console

$ make  IMAGE_LANG=c IMAGE_OS=fedora IMAGE_REGISTRY=quay.io REGISTRY_NAMESPACE=fillme image-build
$ podman login quay.io
$ make  IMAGE_LANG=c IMAGE_OS=fedora IMAGE_REGISTRY=quay.io REGISTRY_NAMESPACE=fillme image-push


```

Note that `quay.io`is the default registry. The above exampl;e shows how to override it.

**Example for using the image:**

From the root of a software project that one wants to compile, arbitrary commands  can be run inside the build continer
as follows, for example `configure`and `make`as well as instaalation of library dependencies.

```console

$ podman  run -it --workdir /work --mount type=bind,source=$(pwd),target=/work,relabel=private  --workdir /work quay.io/fillme/devcontainer/fedora-c:latest  bash  

```

prepuilt fedora, debian, and ubuntu C  images are available on iquay:

* [fedora-c](https://quay.io/repository/madam/devcontainer/fedora-c).
* [idebian-c](https://quay.io/repository/madam/devcontainer/debian-c).
* [ubuntu-c](https://quay.io/repository/madam/devcontainer/ubuntu-c).


