#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/mount.h>

int main() {
    // Mounting /proc and /sys
    if (mount("proc", "/proc", "proc", 0, NULL) == -1) {
        perror("Failed to mount /proc");
        return 1;
    }
    if (mount("sysfs", "/sys", "sysfs", 0, NULL) == -1) {
        perror("Failed to mount /sys");
        return 1;
    }

    // Welcome message
    printf("Welcome to the POSIX shell!\n");

    // Start shell
    execl("/bin/sh", "sh", (char *)0);
    perror("Execl failed");
    return 1;
}