
The purpose of this project is to provide container images that can be used to compile/build and package software projects.

Note that the focus is not on working interactively but on compiling/building with an intention
to provide tooling for creating reproducible builds



**planned characteristics:**

**OS flavors:**
* Fedora Linux
* Debian/Ubuntu Linux

**Language types:**

* C(gcc) and make/autotools/Cmake - for building C language projects
* golang and make - for building golang projects
* Latex/beamer/wiki2beamer and make - build LaTeX documents and LaTex/beamer presentations

**variants:**

* container image packaging
* rpm packaging
* deb packaging


Of these combinations, only the C language images on fedora, debian, and ubuntu are   implemented so far.


In order to build or use these container images,  one will need a system (typically Linux) with docker or podman.






**Example how to build and publish fedora based image for compiling C projects:**

```console

$ make  IMAGE_LANG=c IMAGE_OS=fedora IMAGE_REGISTRY=quay.io REGISTRY_NAMESPACE=fillme image-build
$ podman login quay.io
$ make  IMAGE_LANG=c IMAGE_OS=fedora IMAGE_REGISTRY=quay.io REGISTRY_NAMESPACE=fillme image-push


```

Note that `quay.io`is the default registry. The above example shows how to override it.

**Example for using the image:**

From the root of a software project that one wants to compile, arbitrary commands  can be run inside the build continer
as follows, for example `configure`and `make`as well as installation of library dependencies.

```console

$ podman  run -it --workdir /work --mount type=bind,source=$(pwd),target=/work,relabel=private  --workdir /work quay.io/fillme/devcontainer/fedora-c:latest  bash  

```

It works correspondingly with docker.

prepuilt fedora, debian, and ubuntu C  images are available on quay:

* [fedora-c](https://quay.io/repository/madam/devcontainer/fedora-c).
* [idebian-c](https://quay.io/repository/madam/devcontainer/debian-c).
* [ubuntu-c](https://quay.io/repository/madam/devcontainer/ubuntu-c).


