FROM gitpod/workspace-full

USER gitpod

# kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
RUN kubectl version --client



# minikube
RUN sudo apt-get update -y
RUN sudo apt-get install -y conntrack
RUN curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube
RUN sudo cp minikube /usr/local/bin && rm minikube

# kind
RUN curl -Lo kind https://github.com/kubernetes-sigs/kind/releases/download/v0.7.0/kind-$(uname)-amd64
RUN chmod +x kind
RUN sudo mv kind /usr/local/bin

USER root
CMD ["minikube start"]
