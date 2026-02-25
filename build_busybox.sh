#!/bin/bash

# Script to download and statically compile BusyBox for x86_64

# Set variables
BUSYBOX_VERSION="1.35.0"
INSTALL_PATH="/usr/local/bin"

# Download BusyBox source
wget https://busybox.net/downloads/busybox-$BUSYBOX_VERSION.tar.bz2

# Extract the downloaded file
if [ -f "busybox-$BUSYBOX_VERSION.tar.bz2" ]; then
    tar xjf busybox-$BUSYBOX_VERSION.tar.bz2
else
    echo "Download failed, exiting."
    exit 1
fi

# Compile BusyBox statically
cd busybox-$BUSYBOX_VERSION
make defconfig
make -B CROSS_COMPILE=x86_64-linux-gnu- CONFIG_STATIC=y

# Install the compiled binary
cp busybox $INSTALL_PATH

# Clean up
cd ..
rm -rf busybox-$BUSYBOX_VERSION busybox-$BUSYBOX_VERSION.tar.bz2

echo "BusyBox $BUSYBOX_VERSION statically compiled and installed to $INSTALL_PATH"