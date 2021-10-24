Pull this repo locally with:
```
git clone https://github.com/glitchv0/frontdoor.git
```

Have minikube installed
```
minikube start
```

If on windows do this after start
```
& minikube -p minikube docker-env --shell=powershell | Invoke-Expression
```

If on linux or mac
```
eval $(minikube docker-env) 
```

Build the docker image locally
```
 docker build . -t frontdoor-elam:v1
 ```

 Deploy the image to minikube
 ```
 kubectl apply -f frontdoor-elam.yaml
 ```

 Get the IP and port of the service
 ```
 url=$(minikube service frontdoor-elam-svc --url)
 ```

 Test the service
 ```
curl -d {"Name":"test"} -H "Content-Type: application/json" $url
 ```