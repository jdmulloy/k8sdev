MINIKUBE
minikube start --vm-driver=virtualbox --memory=10000 --cpus=6

HELM
kubectl apply -f rbac.yml
helm init --upgrade --service-account=tiller

NGINX INGRESS CONTROLLER CONTAINER / DEFAULT INGRESS TARGET
# this deploys a nginx pod which monitors /ingress on the api to get its routes
# it then generates an nginx config and uses that to route requests.
minikube addons enable ingress

Setup DNS
get ip
minikube ip

put in etc hosts
192.168.99.119      k8s.local k8s.dashboard k8s.spinnaker k8s.gocd

DASHBOARD
helm install stable/kubernetes-dashboard --name kubernetes-dashboard -f dashboard.yml
navigate to k8s.dashboard

PROMETHEUS(WIP)
helm install --name prometheus stable/prometheus -f prometheus.yml

GRAPHANA(WIP)
helm install --name graphana stable/graphana

JENKINS
helm install --name jenkins stable/jenkins -f jenkins.yml
navigate to k8s.local/jenkins

DRONE
helm install --name my-release stable/drone -f drone.yml
navigate to k8s.local/drone

GOCD
helm install --name gocd-app --namespace gocd stable/gocd -f gocd.yml
navigate to k8s.gocd

SPINNAKER
helm install --name spinnaker stable/spinnaker --timeout 600 -f spinnaker.yml
navigate to k8s.spinnaker

EXTRAS
helm upgrade jenkins stable/jenkins -f jenkins.yml
helm upgrade prometheus stable/prometheus -f prometheus.yml
kubectl -n default port-forward svc/kubernetes-dashboard 8443:443
kubectl -n default port-forward svc/jenkins 8080:8080
minikube service jenkins --url

