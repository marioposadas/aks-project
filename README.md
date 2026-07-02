# Creating an Azure K8s Cluster with Terraform

Proyecto: crear un clúster de AKS en Azure usando Terraform y desplegar una app Nginx de prueba.

## Qué contiene este repositorio

- `main.tf`: recursos principales de Terraform.
- `variables.tf`: variables configurables.
- `outputs.tf`: salidas del clúster.
- `terraform.tfvars.example`: plantilla de variables, sin secretos.
- `app.yaml`: Deployment + Service LoadBalancer de Nginx.
- `checklist.md`: checklist de entrega del proyecto.
- `.gitignore`: evita subir secretos o archivos locales de Terraform.

## Flujo resumido

1. Instalar Azure CLI, Terraform y kubectl.
2. Iniciar sesión en Azure con `az login`.
3. Crear un Resource Group.
4. Crear un Service Principal con permisos de Contributor sobre ese Resource Group.
5. Crear una llave SSH.
6. Ejecutar Terraform: `init`, `plan`, `apply`.
7. Conectarse al clúster con `az aks get-credentials`.
8. Desplegar la app con `kubectl apply -f app.yaml`.
9. Probar la IP externa.
10. Destruir recursos con `terraform destroy` al terminar.
