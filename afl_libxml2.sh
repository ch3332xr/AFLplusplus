#!/usr/bin/env bash

echo -e "[+] Cloning LIBXML2"
git clone https://gitlab.gnome.org/GNOME/libxml2.git ; cd libxml2
echo -e "[+] Configuring... disabling shared libraries"
./autogen.sh
./configure --enable-shared=no
echo -e "[+] Enabling Sanitizers"
export AFL_USE_UBSAN=1
export AFL_USE_ASAN=1
echo -e "[+] Building the lib"
make CC=~/AFLplusplus/AFLplusplus/afl-clang-fast CXX=~/AFLplusplus/AFLplusplus/afl-clang-fast++ LD=~/AFLplusplus/AFLplusplus/afl-clang-fast
echo -e "[+] Creating I/O dirs....Adding seeds"
mkdir fuzz ; cp xmllint fuzz/xmllint_cov ; mkdir fuzz/in ; cp test/*.xml fuzz/in/ ; cd fuzz
echo -e "[+] Configuring Sys 4 AFL++"
sudo ~/AFLplusplus/AFLplusplus/afl-system-config
echo -e "[+] GO fUZZ!!"
~/AFLplusplus/AFLplusplus/afl-fuzz -i in/ -o out -m none -d -- ./xmllint_cov @@
