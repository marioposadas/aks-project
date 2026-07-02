# Checklist de entrega · Creating an Azure K8s Cluster

## 01. Configure the environment — 1 pt
- [ ] Instalé Azure CLI.
- [ ] Instalé Terraform.
- [ ] Instalé kubectl.
- [ ] Ejecuté `az login`.
- [ ] Elegí región: `eastus2`.
- [ ] Ejecuté `az account show`.

Evidencia:
```powershell
az --version
terraform -version
kubectl version --client
az account show
```

## 02. Granting permissions — 1 pt
- [ ] Creé un Service Principal.
- [ ] Le asigné rol Contributor solo sobre el Resource Group.
- [ ] Guardé credenciales localmente, no en GitHub.

Evidencia:
```powershell
az ad sp create-for-rbac --name sp-aks-project --role Contributor --scopes $SCOPE
```

## 03. Create Azure resource group — 1 pt
- [ ] Creé un Resource Group para todo el proyecto.

Evidencia:
```powershell
az group create --name rg-aks-project --location eastus2
```

## 04. Create an Azure storage account — opcional
- [ ] No usado para este proyecto inicial.
- [ ] Terraform state se mantiene localmente.

## 05. Create SSH keys — 1.5 pts
- [ ] Creé llave SSH RSA 4096.
- [ ] Usé la llave pública en Terraform.

Evidencia:
```powershell
ssh-keygen -t rsa -b 4096 -f $env:USERPROFILE\.ssh\aks_terraform_rsa
```

## 06. Terraform script — 1.5 pts
- [ ] Incluí provider `azurerm`.
- [ ] Incluí AKS con `azurerm_kubernetes_cluster`.
- [ ] Incluí output `kube_admin_config`.
- [ ] Usé variables para nombre, región, nodo y llave SSH.

Archivos:
- `main.tf`
- `variables.tf`
- `outputs.tf`
- `terraform.tfvars.example`

## 07. Running the Terraform script — 2 pts
- [ ] Ejecuté `terraform init`.
- [ ] Ejecuté `terraform plan`.
- [ ] Ejecuté `terraform apply`.
- [ ] Validé nodos con `kubectl get nodes`.

Evidencia:
```powershell
terraform init
terraform plan
terraform apply
az aks get-credentials --resource-group rg-aks-project --name aks-project-cluster --overwrite-existing
kubectl get nodes
```

## 08. Deploying an application to AKS — 2 pts
- [ ] Desplegué Nginx con `kubectl apply -f app.yaml`.
- [ ] Verifiqué Service tipo LoadBalancer.
- [ ] Probé IP externa en navegador.

Evidencia:
```powershell
kubectl apply -f app.yaml
kubectl get pods
kubectl get service nginx-demo-service
```

## Limpieza final
- [ ] Ejecuté `terraform destroy` para no gastar crédito.

```powershell
terraform destroy
```
