#!/bin/bash

# Variables
AMI_ID="ami-05c13eab67c5d8861" 
INSTANCE_TYPE="t2.micro"
KEY_NAME="web_keys_camilo"
SECURITY_GROUP_ID="sg-076d89fa2a0962709"
NUMBER_OF_INSTANCES=3
DOCKER_IMAGE="blutlucifugekrieger/simple_web_application:latest" # Imagen de Docker

# Crear instancias EC2
echo "Creando $NUMBER_OF_INSTANCES instancias EC2..."
aws ec2 run-instances \
  --image-id $AMI_ID \
  --instance-type $INSTANCE_TYPE \
  --key-name $KEY_NAME \
  --security-group-ids $SECURITY_GROUP_ID \
  --count $NUMBER_OF_INSTANCES

# Esperar a que las instancias estén en estado 'running'
echo "Esperando a que las instancias estén en estado 'running'..."
aws ec2 wait instance-running --instance-ids $(aws ec2 describe-instances --query "Reservations[].Instances[?State.Name=='pending'].InstanceId" --output text)

# Obtener las direcciones IP públicas de las instancias
INSTANCE_IPS=$(aws ec2 describe-instances --query "Reservations[].Instances[].PublicIpAddress" --output text)

# Instalar Docker en las instancias (si no está instalado)
echo "Instalando Docker en las instancias..."
for IP in $INSTANCE_IPS; do
  ssh -i web_keys_camilo.pem ec2-user@$IP "sudo yum update -y"
  ssh -i web_keys_camilo.pem ec2-user@$IP "sudo yum install docker"
  ssh -i web_keys_camilo.pem ec2-user@$IP "sudo service docker start"
  ssh -i web_keys_camilo.pem ec2-user@$IP "sudo usermod -a -G docker ec2-user"
  ssh -i web_keys_camilo.pem ec2-user@$IP "sudo chkconfig docker on"
done

# Ejecutar un contenedor Docker en las instancias en puertos aleatorios
echo "Ejecutando un contenedor Docker en las instancias..."
for IP in $INSTANCE_IPS; do
  RANDOM_PORT=$(shuf -i 1024-49151 -n 1) # Generar un puerto aleatorio entre 1024 y 49151
  ssh -i web_keys_camilo.pem ec2-user@$IP "sudo docker run -d -p $RANDOM_PORT:80 $DOCKER_IMAGE"

  echo "Contenedor Docker en la instancia $IP se ejecutó en el puerto $RANDOM_PORT"
done

echo "El despliegue de la aplicación en contenedores Docker se ha completado en las siguientes instancias EC2:"
echo $INSTANCE_IPS
