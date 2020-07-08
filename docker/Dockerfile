ARG BASE_NAME=arm32v7-debian-weston
FROM torizon/$BASE_NAME:buster

RUN apt-get -y update && apt-get install -y --no-install-recommends \
    qml-module-qtquick2 \
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
    qml-module-qtqml-models2 \
    qml-module-qtqml-statemachine \
    qml-module-qtquick-controls \
    qml-module-qtquick-controls2 \
    qml-module-qtquick-dialogs \
    qml-module-qtquick-extras \
    qml-module-qtquick-layouts \
    qml-module-qtquick-localstorage \
    qml-module-qtquick-particles2 \
    qml-module-qtquick-privatewidgets \
    qml-module-qtquick-scene2d \
    qml-module-qtquick-scene3d \
    qml-module-qtquick-shapes \
    qml-module-qtquick-templates2 \
    qml-module-qtquick-virtualkeyboard \
    qml-module-qtquick-window2 \
    qml-module-qtquick-xmllistmodel \
    qml-module-qtquick2 \
    qml-module-qtsensors \
    qml-module-qttest \
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

RUN sed -i /etc/ssh/sshd_config -e 's/UsePAM yes/UsePAM no/g' && \
    echo "PermitEmptyPasswords yes" >> /etc/ssh/sshd_config && \
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && \
    sed -i /etc/shadow -e 's/root:.*/root::18254:0:99999:7:::/g'

ENV QT_QPA_PLATFORM="xcb"

RUN echo export XDG_RUNTIME_DIR=/tmp >> /etc/profile && \
    echo export DISPLAY=:0 >> /etc/profile

SHELL ["/bin/bash", "-c"]
RUN test arch == "aarch64" && { cd /usr/lib/aarch64-linux-gnu/ && ln -s libGL.so.1.7.0 libGL.so.1.2; } || true

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
