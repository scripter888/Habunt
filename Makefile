# Compiler and flags
CC = gcc
CFLAGS = -Wall -O2

# Source and object files
SRCS = $(wildcard src/*.c)
OBJS = $(SRCS:.c=.o)

# Output image file
IMG = habunt.img

# Default target
all: $(IMG)

# Rule to create the bootable image
$(IMG): $(OBJS)
	@echo "Creating bootable image $@..."
	dd if=/dev/zero of=$@ bs=1M count=64
	mkfs.ext2 $@ # Assuming the use of ext2 filesystem

# Rule to compile object files
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up
clean:
	rm -f $(OBJS) $(IMG)

.PHONY: all clean
