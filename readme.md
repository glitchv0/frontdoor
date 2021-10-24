You can run the run.sh script to start the server.
```
chmod +x run.sh
./run.sh
```

If you want to run them by hand, you can use the following commands:

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

 To update the env var, edit he frontdoot-elam.yaml file should be line 19.  Then reapply the deployment.
 ```
kubectl replace -f frontdoor-elam.yaml
```

Then you can test the service again and the value will be changed.