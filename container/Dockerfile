FROM centos:7

RUN yum install -y gcc gcc-c++ make wget \
    && yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    && yum install -y lbzip2-utils \
    && mkdir build && cd build && GCC_VERSION=9.2.0 \
    && wget https://ftp.gnu.org/gnu/gcc/gcc-${GCC_VERSION}/gcc-${GCC_VERSION}.tar.gz \
    && tar xzvf gcc-${GCC_VERSION}.tar.gz \
    && mkdir obj.gcc-${GCC_VERSION} \
    && cd gcc-${GCC_VERSION} && ./contrib/download_prerequisites \
    && cd ../obj.gcc-${GCC_VERSION} \
    && ../gcc-${GCC_VERSION}/configure --disable-multilib --enable-languages=c \
    && make -j $(nproc) && make install \
    && yum remove -y wget \
    && cd ../../ && rm -rf build \
    && yum clean all && rm -rf /var/cache/yum
