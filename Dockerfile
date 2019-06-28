FROM runmymind/docker-android-sdk

RUN apt-get update && \
    apt-get install -y lcov git-core curl unzip

RUN apt-get install -y lib32stdc++6 clang

RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

RUN /usr/local/flutter/bin/flutter && \
      apt autoremove -y && \
    rm -rf /var/lib/apt/lists/*

ENV PATH $PATH:/usr/local/flutter/bin/cache/dart-sdk/bin:/usr/local/flutter/bin

WORKDIR /usr/local/src

ADD . .

RUN flutter doctor
