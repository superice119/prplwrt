
[prplWrt](https://prplfoundation.org/working-groups/prplwrt-carrier-feed/)
==========

## Quick start
git clone https://github.com/prplfoundation/prplwrt.git
cd prplwrt
make PRODUCT=router TARGET=intel

... wait ...

You migt have to enter your github username & password

find images in prplwrt/openwrt/bin/targets/intel/

## Motivation

prplWrt is an OpenWrt overlay that simplifies development of commercial
products by focusing on aspects that are important to equipment vendors and
their customers:

* prplWrt's build configuration is versioned, i.e. there is no "menuconfig"
  build target. If you build from the same source you will (or should) end up
  with the same firmware.

* prplWrt is designed to produce complete firmware that can be put through
  QA and is usable out of the box. While it is possible to postinstall packages
  the end-user should not have to. In a sense you can think of prplWrt as
  the cathedral built on top of OpenWrt, the bazar.

* OpenWrt traditionally stays very close to the bleeding edge of open source,
  even on the release branches (e.g. backfire). prplWrt is much more
  conservatively maintained. We try to fix bugs with minimal patches instead of
  updating to the latest snapshots.

* Proprietary closed source software is usually not welcomed into open source
  respositories with open arms. Nevertheless equipment vendors often need to
  add some bells and whistles to differentiate their products. prplWrt is
  designed to make it easy to integrate proprietary software, and even comes
  with some functionality essential to carrier customers pre-integrated.

In short, if you want to build a commercial product based on OpenWrt you should
fork prplWrt! It embodies wisdom from years of experience developing
commercial products based on OpenWrt, and will serve as an excellent starting
point for yours.

## Firmware Images

Pre-built firmware images will be made available in the future.

## Functionality

prplWrt comes with some additional functionality not found in (standard
builds of) OpenWrt.

## Getting Started

You need to have installed git, svn, gcc, g++, binutils, patch, bzip2, flex,
make, gettext, pkg-config, unzip, libz-dev, libncurses-dev, gawk and libc
headers. For example, on a Debian based system run the command:

```
  apt-get install -y git subversion gcc g++ binutils patch bzip2 flex make \
                     gettext pkg-config unzip libz-dev libncurses-dev gawk \
                     gcc-multilib python2.7
```

Then:

1. git clone https://github.com/prplfoundation/prplwrt.git

2. cd prplwrt && make

Basic build configuration is in config.mk. Functionality and default settings
are controlled through what we call product profiles and customizations (in
`products/*/Makefile`).

Next step is to fork this repository and get started making changes!

## OSX requirements

You will need the usual xcode buildtools plus:
- findutils (eg. brew reinstall findutils --with-default-names)

## Copyright and Licensing

The prplWrt build system overlay is licensed under a highly permissive
"3-clause BSD license". See the LICENSE file for more details.

The OpenWrt build system, as well as the software built by the build system, is
licensed separately under their own licenses.

# Development

Changing prplWrt and ajusting it to customize the build input is very easy and straight forward. In simple terms, prplWrt pulls the specified version of openwrt from the upstream repository and applies the patches, changes and modifications before starting the openwrt build process.

## Anatomy of the project

### The Files

#### Makefile
The Makefile is the heart of the project. At the very top you will find the relevant variables that configure the baseline of the build. Below, the script follows ajn established routing to apply all changes and kicking off the openwrt build.

The flow is always as follows:

1. Set openwrt git to correction version by checking out the tag specified in the variable OPENWRT_TAG

2. Then, depending on your input parameters, the changes and modifications will be applied. The input parameters are product, target and customization. Their specifics are detailed below.
Depending on your input parameters, prplWrt will build a few different images. 
It will build images for:
* Every customization applied to
* Every target build for
* Every product

3. At the start of every image build, it performes of hard git reset, removes all copied files and reinstalles the specified packages.

4. Then the version information is displayed

5. Followed by the application of:
* product changes
* target changes

6. Next up are the patches in the order of:
* base patches
* product patches
* target patches

7. Old images are removed

8. The customizations's prebuild routine is called

9. The openwrt config file is being created in the Makefiles "Build" routine

10. The openwrt build is triggered via:
$(MAKE) MAKEOVERRIDES='' -C $(OPENWRT_DIR) V=$(V)

11. After the successful build, the output images are validated and copied into a verbose subfolder structure inside the firmware folder

12. As the final step, the script prints relevant configuration information about products, targets and customizations that were built for

##### Input parameters
###### PRODUCT
The product profile to build. PrplWrt currently only has one profile: router. You can find the product specific instructions in the corresponding subfolder, ie. for the product router they are in BASE_DIR/products/router.

###### TARGET
The target platform to build for. You can find the target specific Makefile in the corresponding subfolder, ie. for the ar71xx platform they are in BASE_DIR/common/targets/ar71xx.

###### CUSTOMIZATION
Customizations are further specializations of each product. They are defined in the product's Makefile, i.e. BASE_DIR/products/router/Makefile. To define a customization simply define a new customization sub routine, ie. "define Customization/default".

#### config.mk
The config.mk holds the variables used to configure the prplWrt build. Variables include the OpenWrt tag to build, the location of the file specifying the package feeds to configure as well as the default packages and the default CONFIG.

#### prpl_feeds.conf
The prpl_feeds.conf holds the additional feeds the openwrt build should download and make available for compilation.

### The Folders

#### common
The common folder holds files that apply to more than one product. In it you will find the target Makefiles for example.

#### package
The package folder holds Makefiles for prplWrt specific packages. These can be either overrides of packages already in Openwrt or simply be additional packages.

#### patches
As the name suggests, the patches folder holds a verbose subfolder structure which holds patches to be applied to the OpenWrt tree.

##### subfolders

###### base/feeds
The package folder holds patches to subfolders of OPENWRT_DIR/feeds/. The patches need to be in subfolders that mirror the folder structure found in the folder mentioned above.

###### base/openwrt
The package folder holds patches to files in the OPENWRT_DIR itself, i.e. patch -p0 < FILENAME

###### base/package
The package folder holds patches to subfolders of OPENWRT_DIR/package/. The patches need to be in subfolders that mirror the folder structure found in the folder mentioned above.

#### products
The products folder holds the configurations and Makefiles for the different product categories supported by prplWrt. Currently, "router" is the only supported category.

Each product subfolder contains a "files" subfolder. The contents if this folder is copied to OPENWRT_DIR/files/ during the build process.

The products also contain patches, which get applied in the same way as described in the section detailing the patches folder.

The last subfolder is called "targets". It holds symbolic links to all targets this product supports. The targets can be found in the targets folder located in the root folder of prplWrt. 

#### scripts
The scripts folder holds files used by the prplWrt Makefile during the build process.

## HowTo

### Change the OpenWrt version
Change the variable "OPENWRT_TAG" in the config.mk file.

### Add a new feed
Add a line to the prpl_feeds.conf. 
Follow the format:
SRC NAME URL
Example:
src-git prpl https://github.com/prplfoundation/

### Add a patch to an OpenWrt package
Add the patch, in the corresponding folder structure, in the patch fodler in the root directory of prplWrt.

### Define a new target
Create a new subfolder in the common/targets/ folder and write a new Makefile.

### Create a customized build
The easiest way and least intrusive way is to go into the Makefile of your product category and create a new customization subroutine. This will allow you to modify the OpenWrt configuration, run custom scripts and apply patches.

To get prplWrt to build images for you customization use the command:

make CUSTOMIZATION=YOUR_CUSTOMIZATIONS_NAME
