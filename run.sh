#!/bin/bash
git clone https://github.com/glitchv0/frontdoor.git
minikube start
eval $(minikube docker-env) 
docker build . -t frontdoor-elam:v1
kubectl apply -f frontdoor-elam.yaml
echo "Sleeping 5 seconds to wait for app deploy"
sleep 5
unset url
url=$(minikube service frontdoor-elam-svc --url)
curl -d {"Name":"test"} -H "Content-Type: application/json" $url