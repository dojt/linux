#!/bin/bash
echo cd to Unity
cd $HOME/my.local/share/Unity                 || exit 1
echo git pull
git pull                                      || exit 1

mkdir $HOME/my.local/include/Unity            2>/dev/null
rm $HOME/my.local/include/Unity/*.h           2>/dev/null
rm $HOME/my.local/lib/libUnity.a              2>/dev/null
cd $HOME/my.local/include/Unity               || exit 1
ln -s `find ../../share/Unity/ -name \*.h | grep /src/ | grep -v /test/ | grep -v /examples/` .  || exit 1

cd $HOME/my.local/share/Unity                 || exit 1

for d in ./src ./extras/fixture/src/ ./extras/memory/src/ ;
do
    pushd $d                                  || exit 1
    for cf in \*.c ;
    do
	gcc -I$HOME/my.local/include/Unity/ -DUNITY_INCLUDE_DOUBLE -c $cf     || exit 1
    done
    popd
done;

for of in  `find . -name \*.o | grep /src/ | grep -v /test/ | grep -v /examples/` ; 
do
    ar rs ../../lib/libUnity.a $of            || exit 1
done
