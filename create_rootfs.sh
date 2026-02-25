#!/bin/bash

# Create root filesystem directory structure

# Create directories
mkdir -p /rootfs/{bin,etc,proc,sys,usr/{bin,sbin,lib,lib64},var/{log,run,tmp}}

# Create device nodes (example node)
mknod -m 622 /rootfs/dev/null c 1 3

# You can add more device nodes as needed here

# Print completion message
echo 'Root filesystem created successfully.'