minikube start
eval $(minikube -p minikube docker-env)
docker build . -t frontdoor-elam:v1
kubectl apply -f frontdoor-elam.yaml
echo "Sleeping 5 seconds to wait for app deploy"
sleep 5
echo "You will need to open a new termianl to curl given url"
echo 'curl -d {"Name":"test"} -H "Content-Type: application/json" url'
minikube service frontdoor-elam-svc --url
