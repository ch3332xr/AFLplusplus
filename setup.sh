#!/usr/bin/env bash

echo -e "[+] Installing dependencies"
sudo apt update
sudo apt upgrade -y
sudo apt install build-essential libtool-bin python3-dev automake flex bison libglib2.0-dev libpixman-1-dev clang python3-setuptools llvm
echo -e "[+] Cloning AFLplusplus"
git clone https://github.com/AFLplusplus/AFLplusplus
cd AFLplusplus
echo -e "[+] Building/Installing"
make distrib
sudo make install
echo -e "[+] All set go fuzz!"
echo  [-------------SkFJX01BSEFLQUwh------------]
echo  follow me on https://github.com/ch3332xr
