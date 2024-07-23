# zsh user
# Homebrew needs to be accerlerated in China
# https://developer.aliyun.com/mirror/homebrew/
# this above link connects to the mirror site of Homebrew in China using Aliyun
echo 'export HOMEBREW_API_DOMAIN="https://mirrors.aliyun.com/homebrew-bottles/api"' >> ~/.zshrc
echo 'export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.aliyun.com/homebrew/brew.git"' >> ~/.zshrc
echo 'export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.aliyun.com/homebrew/homebrew-core.git"' >> ~/.zshrc
echo 'export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.aliyun.com/homebrew/homebrew-bottles"' >> ~/.zshrc
source ~/.zshrc
brew update


# first create a namespace called example
kubectl create namespace example
# create ingress using nginx for this cluster
# the link will block by GFW, so I copied the content of this file from this address and put in ingress.yaml locally
kubectl create -f https://ghproxy.com/https://raw.githubusercontent.com/lyzhang1999/resource/main/ingress-nginx/ingress-nginx.yaml

# same as above, but I put the content in a file called 
kubectl apply -f https://ghproxy.com/https://raw.githubusercontent.com/lyzhang1999/resource/main/metrics/metrics.yaml
# serviceaccount/metrics-server created
# clusterrole.rbac.authorization.k8s.io/system:aggregated-metrics-reader created
# clusterrole.rbac.authorization.k8s.io/system:metrics-server created
# ......


# create a namespace called example
kubectl apply -f kubernetes-example/deploy/database.yaml -n example
kubectl apply -f kubernetes-example/deploy/frontend.yaml -n example
kubectl apply -f kubernetes-example/deploy/backend.yaml -n example


kubectl wait --for=condition=Ready pods --all -n example