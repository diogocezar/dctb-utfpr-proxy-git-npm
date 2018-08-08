#!/bin/sh
proxy="http://10.20.10.50:3128"
if [ $# -eq 0 ]; then
    echo "You need to pass one argument to enable or disable proxy configuration."
    exit 1
fi
if [ $1 = "on" ]; then
    echo "[GIT] Enable proxy: $proxy"
    git config --global http.proxy $proxy
    echo "[NPM] Enable proxy: $proxy"
    npm config set proxy $proxy
    npm config set https-proxy $proxy
    exit 1
else
    if [ $1 = "off" ]; then
        echo "[GIT] Disable proxy: $proxy"
        git config --global --remove-section http
        echo "[NPM] Disable proxy: $proxy"
        npm config rm proxy
        npm config rm https-proxy
        exit 1
    else
        echo "Invalid argument. Please use on or off."
        exit 1
    fi
fi