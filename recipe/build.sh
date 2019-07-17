#!/bin/bash

rm makefile
cp $RECIPE_DIR/CMakeLists.txt .

mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_POSITION_INDEPENDENT_CODE=yes \
    -DBUILD_SHARED_LIBS=yes \
..

make -j${CPU_COUNT}
make install

actual=`echo 123 | ./test`
expected=" 12.146304.367025.329675.766243.241881.295855.454217.088483.382315.
 328918.161829.235892.362167.668831.156960.612640.202170.735835.221294.
 047782.591091.570411.651472.186029.519906.261646.730733.907419.814952.
 960000.000000.000000.000000.000000 "

if [ "$actual" != "$expected" ]; then
    exit 1
fi
