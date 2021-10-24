Have minikube installed
```
minikube start
```

If on windows do this after start
```
& minikube -p minikube docker-env --shell=powershell | Invoke-Expression
```

Build the docker image locally
```
 docker build . -t frontdoor-elam:v1
 ```

 Deploy the image to minikube
 ```
 kubectl apply -f frontdoor-elam.yaml
 ```