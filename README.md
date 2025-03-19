
The purpose of this project is to provide container images that can be used to compile/build and package software projects
along with accompanying cli tooling to facilitate convenient execution of builds in those containers.

Note that the focus is not on working interactively but  instead on compiling/building with an intention
to provide tooling for creating deterministic and reproducible builds



**planned characteristics:**

**OS flavors:**
* Fedora Linux
* Debian/Ubuntu Linux
* maybe opensuse Linux

**Language types:/installed tools**

* c: C(gcc) and make/autotools/Cmake - for building C language projects
* maybe: cpp: make tools an compiler for C++ projects
* go: golang and make - for building golang projects
* latex: LaTeX/beamer/wiki2beamer and make - build LaTeX documents and LaTeX/beamer presentations

**variants:**

* container image packaging
* rpm packaging
* deb packaging


Of these combinations, only the c and latex  images on fedora, debian, ubuntu, and openSUSE  are   implemented so far.


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

prepuilt fedora, debian,  ubuntu, and openSUSE  images for c and latex   images are available on quay:

* [fedora-c](https://quay.io/repository/buildbox/buildbox/fedora-c).
* [idebian-c](https://quay.io/repository/buildbox/buildbox/debian-c).
* [ubuntu-c](https://quay.io/repository/madam/buildbox/ubuntu-c).
* [suse-c](https://quay.io/repository/madam/buildbox/suse-c).
* [fedora-latex](https://quay.io/repository/buildbox/buildbox/fedora-latex).
* [idebian-latex](https://quay.io/repository/buildbox/buildbox/debian-latex).
* [ubuntu-latex](https://quay.io/repository/buildbox/buildbox/ubuntu-latex).
* [suse-latex](https://quay.io/repository/buildbox/buildbox/suse-latex).


**builbo cli:**

Apart from tooling to create container images, the project provides a cli tool `builbo` to facilitate building software projects in the buildbox containers.

example workflow:

```console
$ git clone project
$ cd project_dir
$ edit build.sh
$ builbo -c -l c -o debian -s ./build.sh --build
...
$
```

As a result of this process, build artifacts will be placed under  the CWD (project checkout dir).


