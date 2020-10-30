ARG BASE_NAME=qt5-wayland
ARG TAG=2
FROM torizon/${BASE_NAME}:${TAG}

SHELL ["/bin/bash", "-c"]

RUN apt-get -y update && apt-get install -y --no-install-recommends \
    qml-module-qtquick-controls2 \
    qml-module-qt-websockets \
    qml-module-qt3d \
    qml-module-qtaudioengine \
    qml-module-qtav \
    qml-module-qtbluetooth \
    qml-module-qtcharts \
    qml-module-qtdatavisualization \
    qml-module-qtgraphicaleffects \
    qml-module-qtgstreamer \
    qml-module-qtlocation \
    qml-module-qtmultimedia \
    qml-module-qtnfc \
    qml-module-qtpositioning \
    qml-module-qtqml-statemachine \
    qml-module-qtquick-controls \
    qml-module-qtquick-controls2 \
    qml-module-qtquick-extras \
    qml-module-qtquick-scene2d \
    qml-module-qtquick-scene3d \
    qml-module-qtquick-shapes \
    qml-module-qtquick-templates2 \
    qml-module-qtquick-virtualkeyboard \
    qml-module-qtsensors \
    qml-module-qtwayland-compositor \
    qml-module-qtwebchannel \
    qml-module-qtwebengine \
    qml-module-qtwebkit \
    qml-module-qtwebsockets \
    qml-module-qtwebview \
    qt5-qmltooling-plugins \
    openssh-server \
    gdbserver \
    rsync \
    && apt-get clean && apt-get autoremove && rm -rf /var/lib/apt/lists/*

# Allow empty password hack (only for developement)
# sed -i /etc/ssh/sshd_config -e 's/UsePAM yes/UsePAM no/g'
RUN sed -i 's/nullok_secure/nullok/g' /etc/pam.d/common-auth && \
    echo "PermitEmptyPasswords yes" >> /etc/ssh/sshd_config && \
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && \
    sed -i /etc/shadow -e 's/root:.*/root::18254:0:99999:7:::/g'

COPY entrypoint.sh /entrypoint.sh

RUN echo "set -o allexport; . /etc/environment; set +o allexport;" >> /etc/profile

ENTRYPOINT ["/entrypoint.sh"]
