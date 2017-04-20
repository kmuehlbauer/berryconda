#!/bin/bash

CFLAGS="-fPIC" ./configure --shared --prefix=$PREFIX

make -j${CPU_COUNT}
make check
make install

# Remove man files.
rm -rf $PREFIX/share

# Copy license file to the source directory so conda-build can find it.
cp $RECIPE_DIR/license.txt $SRC_DIR/license.txt
