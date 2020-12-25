FROM archlinux:latest

RUN pacman -Syu --noconfirm && pacman -S --noconfirm \
    mingw-w64-binutils \
    mingw-w64-crt \
    mingw-w64-gcc \
    mingw-w64-headers \
    mingw-w64-winpthreads \
    git \
    wget \
    perl \
    zip \
    unzip \
    npm \
    cmake \
    base-devel

ENV mingwurl=https://github.com/Studio-Link/mingw/releases/download/v20.03.0
RUN wget $mingwurl/mingw-w64-configure-0.1.1-9-any.pkg.tar.xz \
         $mingwurl/mingw-w64-environment-1-2-any.pkg.tar.xz \
         $mingwurl/mingw-w64-pkg-config-2-4-any.pkg.tar.xz
RUN yes | LANG=C pacman -U *.pkg.tar.xz

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["build"]
