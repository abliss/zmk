#!/bin/bash
set -exuo pipefail
source env-working.txt
if false; then
    pip3 install west
    west init -l config
    west update
    west zephyr-export
    wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | sudo apt-key add -
    apt-get update
    agi cmake
    npm install @actions/artifact
    ln -sf /usr/bin/python3.6 ~/bin/python
    agi --no-install-reccomends   ccache   cmake   file   gcc   gcc-multilib   git   gperf   make   ninja-build   python3   python3-dev   python3-pip   python3-setuptools   python3-wheel
    agi gcc-multilib-arm-linux-gnueabi
    pip3 install   -r https://raw.githubusercontent.com/zephyrproject-rtos/zephyr/v${ZEPHYR_VERSION}/scripts/requirements-base.txt   
    wget -q "https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${ZEPHYR_SDK_VERSION}/${ZEPHYR_SDK_SETUP_FILENAME}"   && sh ${ZEPHYR_SDK_SETUP_FILENAME} --quiet -- -d ${ZEPHYR_SDK_INSTALL_DIR}   
    TMPDIR=/home/abliss/tmp/ sh ${ZEPHYR_SDK_SETUP_FILENAME} --quiet -- -d ${ZEPHYR_SDK_INSTALL_DIR}   
fi
west build -s zmk/app -b corne-ish_zen_left -- -DZMK_CONFIG="$(pwd)/config"
if false; then
    west build -d build-right -s zmk/app -b corne-ish_zen_right -- -DZMK_CONFIG="$(pwd)/config"
fi

ls -l  build/zephyr/zmk.uf2 build-right/zephyr/zmk.uf2
echo "plug in a half, doubleclick reset, wait for breathing blue LED, and do: "
echo "sudo cp build/zephyr/zmk.uf2 /android/mnt/media_rw/0042-0042/"
echo "sudo cp build-right/zephyr/zmk.uf2 /android/mnt/media_rw/0042-0042/"
