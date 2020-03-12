#!/bin/bash

set -xe;

if type "tee" 2>/dev/null && [ -n "${UBUNTU_SOURCE}" ]; then
    SOURCE_PATH="/etc/apt/sources.list"
    # source os-release, import variable UBUNTU_CODENAME
    source /etc/os-release;
    cp ${SOURCE_PATH} ${SOURCE_PATH}.bak && rm -rf ${SOURCE_PATH}
    case "${UBUNTU_SOURCE}" in
        "aliyun")
            tee ${SOURCE_PATH} <<EOF
deb http://mirrors.aliyun.com/ubuntu/ ${UBUNTU_CODENAME} main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ ${UBUNTU_CODENAME}-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ ${UBUNTU_CODENAME}-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ ${UBUNTU_CODENAME}-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ ${UBUNTU_CODENAME}-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ ${UBUNTU_CODENAME} main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ ${UBUNTU_CODENAME}-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ ${UBUNTU_CODENAME}-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ ${UBUNTU_CODENAME}-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ ${UBUNTU_CODENAME}-backports main restricted universe multiverse
EOF
;;
        "zju")
            tee ${SOURCE_PATH} <<EOF
deb http://mirrors.zju.edu.cn/ubuntu/ ${UBUNTU_CODENAME} main multiverse restricted universe
deb http://mirrors.zju.edu.cn/ubuntu/ ${UBUNTU_CODENAME}-backports main multiverse restricted universe
deb http://mirrors.zju.edu.cn/ubuntu/ ${UBUNTU_CODENAME}-proposed main multiverse restricted universe
deb http://mirrors.zju.edu.cn/ubuntu/ ${UBUNTU_CODENAME}-security main multiverse restricted universe
deb http://mirrors.zju.edu.cn/ubuntu/ ${UBUNTU_CODENAME}-updates main multiverse restricted universe
deb-src http://mirrors.zju.edu.cn/ubuntu/ ${UBUNTU_CODENAME} main multiverse restricted universe
deb-src http://mirrors.zju.edu.cn/ubuntu/ ${UBUNTU_CODENAME}-backports main multiverse restricted universe
deb-src http://mirrors.zju.edu.cn/ubuntu/ ${UBUNTU_CODENAME}-proposed main multiverse restricted universe
deb-src http://mirrors.zju.edu.cn/ubuntu/ ${UBUNTU_CODENAME}-security main multiverse restricted universe
deb-src http://mirrors.zju.edu.cn/ubuntu/ ${UBUNTU_CODENAME}-updates main multiverse restricted universe
EOF
;;
        "tsinghua")
            tee ${SOURCE_PATH} <<EOF
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ ${UBUNTU_CODENAME} main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ ${UBUNTU_CODENAME} main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ ${UBUNTU_CODENAME}-updates main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ ${UBUNTU_CODENAME}-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ ${UBUNTU_CODENAME}-backports main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ ${UBUNTU_CODENAME}-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ ${UBUNTU_CODENAME}-security main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ ${UBUNTU_CODENAME}-security main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ ${UBUNTU_CODENAME}-proposed main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ ${UBUNTU_CODENAME}-proposed main restricted universe multiverse
EOF
;;
        "163")
            tee ${SOURCE_PATH} <<EOF
deb http://mirrors.163.com/ubuntu/ ${UBUNTU_CODENAME} main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ ${UBUNTU_CODENAME}-security main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ ${UBUNTU_CODENAME}-updates main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ ${UBUNTU_CODENAME}-proposed main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ ${UBUNTU_CODENAME}-backports main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ ${UBUNTU_CODENAME} main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ ${UBUNTU_CODENAME}-security main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ ${UBUNTU_CODENAME}-updates main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ ${UBUNTU_CODENAME}-proposed main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ ${UBUNTU_CODENAME}-backports main restricted universe multiverse
EOF
;;
        "ustc")
            tee ${SOURCE_PATH} <<EOF
deb https://mirrors.ustc.edu.cn/ubuntu/ ${UBUNTU_CODENAME} main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ ${UBUNTU_CODENAME} main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu/ ${UBUNTU_CODENAME}-updates main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ ${UBUNTU_CODENAME}-updates main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu/ ${UBUNTU_CODENAME}-backports main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ ${UBUNTU_CODENAME}-backports main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu/ ${UBUNTU_CODENAME}-security main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ ${UBUNTU_CODENAME}-security main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu/ ${UBUNTU_CODENAME}-proposed main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ ${UBUNTU_CODENAME}-proposed main restricted universe multiverse
EOF
;;
        *)
            echo "Please check whether there is aliyun|zju|tsinghua|163|ustc in the parameter"
            exit 1;;
    esac
fi
