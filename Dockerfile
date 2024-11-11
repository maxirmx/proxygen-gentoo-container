FROM gentoo/stage3:latest

# Sync and update Gentoo
RUN emerge-webrsync && \ 
    emerge --sync && \
    emerge -uvND world 

RUN emerge dev-vcs/git dev-libs/boost dev-libs/double-conversion dev-libs/libevent dev-libs/libsodium dev-cpp/gflags dev-cpp/glog && \
    cd root && \
    git clone https://github.com/fastfloat/fast_float.git && \
    cp -r fast_float/include /usr/local/include/ && \
    git clone https://github.com/facebook/proxygen.git --depth 1 && \
    cd proxygen/proxygen  && \
    ./build.sh	&& \
    ./install.sh && \
    rm -rf _build && \
    ./build.sh && \
    ./install.sh
