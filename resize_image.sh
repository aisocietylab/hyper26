#!/usr/bin/env bash

# Resize all images in a directory to a specific size
IMAGES_DIR="./assets/images"
# FIXME: use glob pattern
#for image in "$IMAGES_DIR"/*.{jpg,png}; do
for image in $(find $IMAGES_DIR -type f -name "*.jpg" -o -name "*.png"); do
    # backup old image, rename to `<name>_bak.<ext>`
    backup_image="${image}.bak"

    # if not exists
    if [ ! -f $backup_image ]; then
        mv $image $backup_image
        # Resize the image to 300x300, slicing out the center.
        convert $backup_image -resize 300x300^ -gravity center -extent 300x300 $image
    fi
done