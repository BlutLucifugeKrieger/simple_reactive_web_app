
Made by Camilo Castro / Hecho por Camilo Castro

-------------------------------ANGULAR(INSTRUCCIONES AUTO GENERADAS)-----------------------------

# WebCalculator

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 16.2.4.

## Development server

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The application will automatically reload if you change any of the source files.

## Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

## Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory.

## Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

## Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via a platform of your choice. To use this command, you need to first add a package that implements end-to-end testing capabilities.

## Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI Overview and Command Reference](https://angular.io/cli) page.

---------------------------------- EXPLICACION CODIGO---------------------------------------------------------------

En primer lugar, definimos los componentes en la capa de vista(HTML), en el caso de los inputText, definimos una relacion 
de event binding, en donde, a traves del archivo Tyscript del componente angular, se pueda relacionar la funcion en cuestion.
la funcion se ejecuta una vez se da click en el componente Input, y captura el valor numerico introducio para realizar una conversion de string a entero
mediante el uso de la funcion: calculatevalNumb1(), esta funcion nos solicita un evento como parametro y se lo indicamos usando "$event", de este modo, 
hacemos referencia al evento actual que estamos ejecutando es decir, el click del usuario.

archivo HTML del componente calculadora:

![image](https://github.com/BlutLucifugeKrieger/simple_reactive_web_app/assets/130005378/f5a1a9ee-fcc3-41ea-bb95-682704ed4ffa)


archivo Typescript del componente calculadora:

![image](https://github.com/BlutLucifugeKrieger/simple_reactive_web_app/assets/130005378/61b139fb-9462-4ad6-83eb-c86371bd7667)


Por otro lado, tendriamos los botones para ejecutar la accion de operacion entre el numero uno y el numero dos,
para ello se definieron los siguientes botones:

![image](https://github.com/BlutLucifugeKrieger/simple_reactive_web_app/assets/130005378/95b2abe3-b197-43fd-aac6-495604269580)

A dichos botones, se les vinculo una funcion (suma,resta y multiplicacion) respectivamente:

Archivo Typescript del componente calculadora:

![image](https://github.com/BlutLucifugeKrieger/simple_reactive_web_app/assets/130005378/f6709571-7f44-4ac2-9167-e0fad5571182)

Asimismo, se realizo una interpolacion para extraer algunas propidades definidas en el archivo Typescript, esto me ayuda, al 
despliegue y visualizacion en tiempo real de cada uno de los numeros que esta dgitando el usuario:

![image](https://github.com/BlutLucifugeKrieger/simple_reactive_web_app/assets/130005378/ac014565-1742-43ad-a6b9-67d34a447266)

Finalmente, mediante un componente de tipo parrafo en la vista, se despliega el resultado obtendio al ejecutar los eventos atraves de los botones:

![image](https://github.com/BlutLucifugeKrieger/simple_reactive_web_app/assets/130005378/a703302c-e304-4ed4-9262-ac91419ce48f)


En cuanto a los estilos, se ajustaron empleando Bootstrap y el archivo propio de estilos del componente en cuestion:

![image](https://github.com/BlutLucifugeKrieger/simple_reactive_web_app/assets/130005378/6a66cff2-5896-42fc-a08b-1478719021f8)
................................. entres otras configuraciones.

Extra: (parrafo del creador)

![image](https://github.com/BlutLucifugeKrieger/simple_reactive_web_app/assets/130005378/9d85bfeb-c125-4d97-b47e-c76d8e6897d4)


----------------------------------DOCKERIZACION-----------------------------------------------------------



Creamos la imagen:

![image](https://github.com/BlutLucifugeKrieger/simple_reactive_web_app/assets/130005378/9a0bdfae-133c-4ef6-b623-e2501bf9ac4c)

Creamos el contenedor de prueba y revisamos que se este ejecutando correctamente:

![image](https://github.com/BlutLucifugeKrieger/simple_reactive_web_app/assets/130005378/beb87cfa-4455-4fc8-be2b-85e49dba0586)

![image](https://github.com/BlutLucifugeKrieger/simple_reactive_web_app/assets/130005378/1fde6b81-5fc6-4736-a9cf-3e5c32213e25)

Revisamos que efectivamente se este ejecutando en localhost y con el puerto mapeado:

![image](https://github.com/BlutLucifugeKrieger/simple_reactive_web_app/assets/130005378/daa2d590-f7ba-46a7-9991-13f64e309064)


En este punto, subimos la imagen a DockerHub
En mi caso, ya lo realice y este es el link de mi repositorio: https://hub.docker.com/r/blutlucifugekrieger/simple_web_application

![image](https://github.com/BlutLucifugeKrieger/simple_reactive_web_app/assets/130005378/49ae7720-42c2-4a2a-91cf-1d9c77fb4d2a)


---------------------------VIRTUALIZACION CON AWS (EC2) USANDO UN SCRIPT---------------------------------------------


En este punto, opte por hacer un archivo.sh ejecutable, para realizar la configuracion y despliegue de contenedores docker en 
la maquina virtual de AWS.
Para ello en un bloc de nota se definieron como variables el ami_id, el tipo de instancia, el grupo de seguridad, numero de instancias a desplegar (EC2) y la imagen de docker

#!/bin/bash

# Variables
AMI_ID="ami-05c13eab67c5d8861" 
INSTANCE_TYPE="t2.micro"
KEY_NAME="web_keys_camilo"
SECURITY_GROUP_ID="sg-076d89fa2a0962709"
NUMBER_OF_INSTANCES=3
DOCKER_IMAGE="blutlucifugekrieger/simple_web_application:latest" # Imagen de Docker

---------------------------------------------------------------------------------------------

Se procedio a realizar las instancias EC2:

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

----------------------------------------------------------------------------------------------

Asimismo, se obtuvo cada una de las direcciones IPS de las instancias EC2 junto con la definicion de los comandos para instalar docker en cada una de las instancias EC2:

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

--------------------------------------------------------------------------------------------

Finalmente, se realizo un "for" para generar numeros aleatorios en un rango de 1024 a 49151 (puertos fisicos) los cuales fueron mapeados al puerto 80 de docker

# Ejecutar un contenedor Docker en las instancias en puertos aleatorios
echo "Ejecutando un contenedor Docker en las instancias..."
for IP in $INSTANCE_IPS; do
  RANDOM_PORT=$(shuf -i 1024-49151 -n 1) # Generar un puerto aleatorio entre 1024 y 49151
  ssh -i web_keys_camilo.pem ec2-user@$IP "sudo docker run -d -p $RANDOM_PORT:80 $DOCKER_IMAGE"

  echo "Contenedor Docker en la instancia $IP se ejecutó en el puerto $RANDOM_PORT"
done

echo "El despliegue de la aplicación en contenedores Docker se ha completado en las siguientes instancias EC2:"
echo $INSTANCE_IPS

--------------------------------------------------------------------------------------------

Algunas de las capturas del proceso son: 

![image](https://github.com/BlutLucifugeKrieger/simple_reactive_web_app/assets/130005378/66ed9dfd-977c-4d71-8403-b0087fb66ad0)

![image](https://github.com/BlutLucifugeKrieger/simple_reactive_web_app/assets/130005378/b17d55b0-8696-4d1f-a827-d3c0d58f13b6)

![image](https://github.com/BlutLucifugeKrieger/simple_reactive_web_app/assets/130005378/93b6c4cc-10f4-4605-9392-2767444008b4)


------------------------VERIFICACION DEL FUNCIONAMIENTO------------------------------------

Verificacion de que docker este instalado y que efectivamente se este ejecutando una instacia del contenedor de la imagen (blutlucifugekrieger/simple_web_application:latest)
![image](https://github.com/BlutLucifugeKrieger/simple_reactive_web_app/assets/130005378/67257950-fe49-4b63-bbfb-d9a52d4bd1cf)

En este caso se esta ejecutando en el puerto 31416, y efectivamente la aplicacion se esta ejecutando correctamente:
![image](https://github.com/BlutLucifugeKrieger/simple_reactive_web_app/assets/130005378/1a080bbe-7d5a-4a1a-82aa-ec7117444eb3)

En otras instancias, como vemos, tambien se esta ejecutando la instancia del contenedor correctamente, en este caso en el puerto 40760: 

![image](https://github.com/BlutLucifugeKrieger/simple_reactive_web_app/assets/130005378/60e93ff2-d58f-4cf5-a9c7-c7d6ba9d9c5e)

Respecto al aplicativo, en efecto se esta ejecutando correctamente:

![image](https://github.com/BlutLucifugeKrieger/simple_reactive_web_app/assets/130005378/f03e91c6-b0b6-4ae9-9b8f-a92eaf26f25a)

Finalmente, en la ultima instancia EC2, podemos apreciar que efectivamente la aplicacion se esta ejecutando correctamente en el puerto 33814:

![image](https://github.com/BlutLucifugeKrieger/simple_reactive_web_app/assets/130005378/f56968b6-4753-42ee-8187-60e62f7a7ddd)

![image](https://github.com/BlutLucifugeKrieger/simple_reactive_web_app/assets/130005378/c8a9aa7b-7d8f-4059-b83f-267fd0b6c4e1)





NOTA: El script (.sh) se encuentra dentro del proyecto en la carpeta llamada "script_shell" junto con la key utilizada.

















