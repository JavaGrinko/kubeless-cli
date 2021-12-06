FROM node:17  

ENV KUBELESS_VERSION="v1.0.8" \
    KUBERNETES_VERSION="1.21.5" 

RUN curl -LO https://github.com/kubeless/kubeless/releases/download/${KUBELESS_VERSION}/kubeless_linux-amd64.zip && \
    unzip kubeless_linux-amd64.zip && \
    rm -f kubeless_linux-amd64.zip && \
    chmod +x bundles/kubeless_linux-amd64/kubeless && \
    mv bundles/kubeless_linux-amd64/kubeless /usr/local/bin/

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v${KUBERNETES_VERSION}/bin/linux/amd64/kubectl && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/

WORKDIR /workspace

