#!/bin/bash
echo cd to QuEST
cd $HOME/my.local/share/QuEST                   || exit 1
echo git pull
git pull                                        || exit 1

find . -type f -exec sed -i s/'-mavx'//g {} \;  || exit 1
rm -rf build
mkdir build
cd build                                        || exit 1
cmake ..                                        || exit 1
make                                            || exit 1
./demo                                          || exit 1

cp QuEST/libQuEST.so ../../../lib/              || exit 1

make clean                                      || exit 1


cd ../../..                                     || exit 1
cd include                                      || exit 1
ln -fs ../share/QuEST/QuEST/include/*.h .       || exit 1



echo '_________________________________________________'
echo $0 done.
