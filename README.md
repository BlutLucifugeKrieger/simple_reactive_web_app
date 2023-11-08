
Made by Camilo Castro

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

![image](https://github.com/BlutLucifugeKrieger/simple_reactive_web_app/assets/130005378/09bf37dc-9c15-4cc6-a3d0-6d22d202cb38)

En este punto, subimos la imagen a DockerHub
En mi caso, ya lo realice y este es el link de mi repositorio: https://hub.docker.com/r/blutlucifugekrieger/simple_web_application

---------------------------VIRTUALIZACION CON AWS (EC2)----------------------------------------------------










