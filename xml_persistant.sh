#!/usr/bin/env bash

echo -e "[+] Rebuilding XMLLINT "
rm xmllint
make CC=~/AFLplusplus/AFLplusplus/afl-clang-fast CXX=~/AFLplusplus/AFLplusplus/afl-clang-fast++ LD=~/AFLplusplus/AFLplusplus/afl-clang-fast
cp xmllint fuzz/xmllint_persistent ; cd fuzz
echo -e "[+] All Set Hail Persistent Mode "
~/AFLplusplus/AFLplusplus/afl-fuzz -i in/ -o out -m none -d -- ./xmllint_persistent @@
