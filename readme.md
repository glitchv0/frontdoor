# You can run the run.sh script to start the server. (macOS/linux only)
```
chmod +x run.sh
./run.sh
```

# If you want to run them by hand, you can use the following commands:

Pull this repo locally with:
```
git clone https://github.com/glitchv0/frontdoor.git
```

Have minikube installed
```
minikube start
```

If on linux or mac
```
eval $(minikube -p minikube docker-env)  
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
 minikube service frontdoor-elam-svc --url
 ```

 Test the service, the url should be from the above command
 ```
curl -d {"Name":"test"} -H "Content-Type: application/json" url
 ```

 To update the env var, edit he frontdoor-elam.yaml file should be line 19.  Then reapply the deployment.
 ```
kubectl replace -f frontdoor-elam.yaml
```

Then you can test the service again and the value will be changed.

# Now to run nginx proxy
```
kubectl apply -f nginx.yaml
```

This will make a configmap for nginx to use, create a service for nginx to use, and then apply the deployment.  To test the service, you can use the following command:
```
minikube service nginx-custom --url
curl -d {"Name":"test"} -H "Content-Type: application/json" nginxurl
```

You should see new headers, including one saying it is from nginx.