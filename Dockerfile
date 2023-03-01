# Image that will be used
FROM fedora:36

# Shell that will be used
SHELL ["/bin/bash", "-c"]

ENV USER odin

# Setting up the user environment
RUN groupadd --gid=1002 ${USER} && \ 
    useradd --uid=1001 --gid=${USER} --create-home ${USER} && \
    echo "odin ALL=NOPASSWD : ALL" >> /etc/sudoers && \
    sudo -u ${USER} mkdir /home/${USER}/project && \
    sudo -u ${USER} mkdir /home/${USER}/bin && \
    sudo -u ${USER} mkdir -p /home/${USER}/.local/bin


# Installing all development dependencies
RUN dnf -y install \
    python3 glibc-devel \
    gcc gcc-g++ gdb \
    make cmake autoconf \
    automake git libtool \
    dh-autoreconf lcov \
    arm-none-eabi-gcc-cs \
    arm-none-eabi-gcc-cs-c++ \
    arm-none-eabi-binutils-cs \
    arm-none-eabi-newlib.noarch \
    cppcheck 


WORKDIR /home/${USER}

# Getting CppUTest from github
RUN git clone https://github.com/cpputest/cpputest.git

# Setting up CppUTest 
WORKDIR /home/${USER}/cpputest
RUN autoreconf --install
RUN ./configure
RUN make tdd
ENV CPPUTEST_HOME=/home/${USER}/cpputest

# Providing system information like adding things to the path and setting up the language to be used
ENV PATH=/home/${USER}/bin:$PATH \
    PATH=/usr/include:$PATH \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=C.UTF-8


# Finnishing off by setting the user and changing into the project directory
WORKDIR /home/${USER}/project
RUN sudo chown -R ${USER}:${USER} /home/${USER}/project/
ENV HOME /home/${USER}
ENV ARMGCC_DIR /usr
USER ${USER}
