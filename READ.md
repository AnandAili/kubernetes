# Kubernetes Services

## Connecting External Services. For example: database running outside cluster

## Connecting External Services

Running commands in the Pod's container
```kubectl exec -it <pod-name> -- <command>```
For example: ```kubectl exec -it kubia-rc-jqh2f -- bash```

> Note: curl-ing to service is possible,but ping does not work for service.

## Exposing Services to External Clients



# Namespace and Context
Create two lower environments DEV and TA. And env PROD for the Production using Namespaces
Kubernetes
- [x] dev
- [x] ta
- [x] prod

## How DO I create different environments?
Use the following commands in order to create different environments. In my case I will 
create dev, ta and prod environments.

```k create -f dev-namespace.yaml```
```k create -f ta-namespace.yaml```
```k create -f prod-namespace.yaml```

If you list all the namespaces, you will see above created namespaces as well
```
$ k get namespaces
NAME              STATUS   AGE
default           Active   135d
dev               Active   4m3s
docker            Active   135d
kube-node-lease   Active   135d
kube-public       Active   135d
kube-system       Active   135d
prod              Active   60s
ta                Active   2m52s
```

Let's create some pods in dev namespace. Current context docker-desktop is being set.

### How do I create a context for dev namespace and set it as a current namespace for
creating further  resources under it?
We can easily modify current context to point to any namespace.
``` kubectl config set-context $(kubectl config current-context) --namespace=<name>```
Above command command will modify the current context to the namespace provided in the
namespace option

Let's try to Modify the current context to the dev namespace.
```k config set-context $(k config current-context) --namespace=dev
Context "docker-desktop" modified. ```

### How do I test what namespace is set in the current context?
Display all context. thats where can see all context and its namespaces.
```
k config get-contexts
CURRENT   NAME                                                            CLUSTER                                                         AUTHINFO                                                        NAMESPACE
          arn:aws:eks:eu-west-1:303003123018:cluster/c59093-eks-cluster   arn:aws:eks:eu-west-1:303003123018:cluster/c59093-eks-cluster   arn:aws:eks:eu-west-1:303003123018:cluster/c59093-eks-cluster
          arn:aws:eks:eu-west-1:303003123018:cluster/dipclusterc2         arn:aws:eks:eu-west-1:303003123018:cluster/dipclusterc2         arn:aws:eks:eu-west-1:303003123018:cluster/dipclusterc2
          arn:aws:eks:eu-west-1:303003123018:cluster/ga1423-eks-cluster   arn:aws:eks:eu-west-1:303003123018:cluster/ga1423-eks-cluster   arn:aws:eks:eu-west-1:303003123018:cluster/ga1423-eks-cluster
          docker
*         docker-desktop                                                  docker-desktop                                                  docker-desktop                                                  dev
          docker-for-desktop                                              docker-desktop                                                  docker-desktop
          minikube                                                        minikube                                                        minikube
```
 
