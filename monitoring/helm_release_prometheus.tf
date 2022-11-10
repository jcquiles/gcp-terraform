provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "prometheus" {
  name             = "prom"
  chart            = "kube-prometheus-stack"
  repository       = "https://prometheus-community.github.io/helm-charts"
  namespace        = "monitoring"
  version          = "17.1.3"
  create_namespace = true
  wait             = true
  reset_values     = true
  max_history      = 3



    set {
    name  = "kubeControllerManager"
    value = false
    type  = "auto"
  }


    set {
    name  = "kubeDns"
    value = false
    type  = "auto"
  }

    set {
    name  = "kubeEtcd"
    value = false
    type  = "auto"
  }

    set {
    name  = "kubeProxy"
    value = false
    type  = "auto"
  }

    set {
    name  = "kubeScheduler"
    value = false
    type  = "auto"
  }

    set {
    name  = "nodeExporter"
    value = false
    type  = "auto"
  }
}