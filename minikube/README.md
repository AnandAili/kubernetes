# Setting up Kubernetes Cluster

## Minikune
- [x] Uninstall Minikube if already installes

### Uninstalling minikube 
```
minikube stop; minikube delete &&
docker stop $(docker ps -aq) &&
rm -rf ~/.kube ~/.minikube &&
sudo rm -rf /usr/local/bin/localkube /usr/local/bin/minikube &&
launchctl stop '*kubelet*.mount' &&
launchctl stop localkube.service &&
launchctl disable localkube.service &&
sudo rm -rf /etc/kubernetes/ &&
docker system prune -af --volumes
```

### Unintall `kubectl`
I was unable to figure out how to uninstall `kubectl` in my MacBook Pro. I tried it using `brew uninstall kubectl`, `brew uninstall kubernetes-cli`.
But finally when I uninstall docker-desktop, it inturn uninstalls the kubectl.

### Install 'kubectl'
[Install kubectl on mac](https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-on-macos), I am just following instructions from 
kubernetes documentation. This is good enough as of now 

### Install minikube
[Install minikube on mac](), It's quite easy to get started with kubernetes using minikube.

- Download minikube and make it executable
  ```
  curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64 \
  >   && chmod +x minikube
```

- Move it to `/usr/local/bin`
```
mv minikube /usr/local/bin
```

- Start Minikube
```
[aili@macbook /usr/local/bin] $ minikube start
😄  minikube v1.6.2 on Darwin 10.15.2
✨  Automatically selected the 'virtualbox' driver (alternates: [])
💿  Downloading VM boot image ...
    > minikube-v1.6.0.iso.sha256: 65 B / 65 B [--------------] 100.00% ? p/s 0s
    > minikube-v1.6.0.iso: 150.93 MiB / 150.93 MiB [-] 100.00% 7.86 MiB p/s 19s
🔥  Creating virtualbox VM (CPUs=2, Memory=2000MB, Disk=20000MB) ...
🐳  Preparing Kubernetes v1.17.0 on Docker '19.03.5' ...
💾  Downloading kubelet v1.17.0
💾  Downloading kubeadm v1.17.0
🚜  Pulling images ...
🚀  Launching Kubernetes ...
⌛  Waiting for cluster to come online ...
🏄  Done! kubectl is now configured to use "minikube"
```
When minikube started the second time, you could see the below messages,

```
[aili@macbook /usr/local/bin] $ minikube start
😄  minikube v1.6.2 on Darwin 10.15.2
✨  Automatically selected the 'virtualbox' driver (alternates: [])
🔥  Creating virtualbox VM (CPUs=2, Memory=2000MB, Disk=20000MB) ...
🐳  Preparing Kubernetes v1.17.0 on Docker '19.03.5' ...
🚜  Pulling images ...
🚀  Launching Kubernetes ...
⌛  Waiting for cluster to come online ...
🏄  Done! kubectl is now configured to use "minikube"
```
there is something different initialization setup in first time start and in second start up
what is the difference?


- Check the status of Minikube
```
[aili@macbook /usr/local/bin] $ minikube status
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured
```
- Try runnning any Kubernetes REsources in it
```
kubectl config current-context
minikube
[aili@macbook ~/.kube] $ kubectl config get-contexts
CURRENT   NAME       CLUSTER    AUTHINFO   NAMESPACE
*         minikube   minikube   minikube
[aili@macbook ~/.kube] $ kubectl get -ns
You must specify the type of resource to get. Use "kubectl api-resources" for a complete list of supported resources.

error: Required resource not specified.
Use "kubectl explain <resource>" for a detailed description of that resource (e.g. kubectl explain pods).
See 'kubectl get -h' for help and examples
[aili@macbook ~/.kube] $ kubectl get -n
Error: flag needs an argument: 'n' in -n
See 'kubectl get --help' for usage.
[aili@macbook ~/.kube] $ kubectl get ns
NAME              STATUS   AGE
default           Active   16m
kube-node-lease   Active   16m
kube-public       Active   16m
kube-system       Active   16m
[aili@macbook ~/.kube] $ kubectl run --generator=run-pod/v1 nginx-pod --image=nginx
pod/nginx-pod created
[aili@macbook ~/.kube] $ kubectl get pods
NAME        READY   STATUS              RESTARTS   AGE
nginx-pod   0/1     ContainerCreating   0          7s
[aili@macbook ~/.kube] $ kubectl get pods
NAME        READY   STATUS              RESTARTS   AGE
nginx-pod   0/1     ContainerCreating   0          11s
[aili@macbook ~/.kube] $ kubectl get pods
NAME        READY   STATUS              RESTARTS   AGE
nginx-pod   0/1     ContainerCreating   0          13s
[aili@macbook ~/.kube] $ kubectl get pods
NAME        READY   STATUS    RESTARTS   AGE
nginx-pod   1/1     Running   0          17s

```
It seems minikube is installed perfectly fine and stop the resources started in the previous example

```
[aili@macbook ~/.kube] $ k delete pod nginx-pod
pod "nginx-pod" deleted
```

- And Stop Minikube 
```
[aili@macbook ~/.kube] $ minikube stop
✋  Stopping "minikube" in virtualbox ...
🛑  "minikube" stopped.
```
- Delete the Minikube. I gonna keep it for running next examples
```
[aili@macbook ~/.kube] $ minikube delete
🔥  Deleting "minikube" in virtualbox ...
💔  The "minikube" cluster has been deleted.
🔥  Successfully deleted profile "minikube"
```


