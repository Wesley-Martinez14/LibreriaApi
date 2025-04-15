# LibreriaApi
el contenedor de postgres se sale apenas abriendo con sudo terraform apply borre la carpeta postgres_data y vuelvela a crear con los siguientes comandos

rm -rf postgres_data
mkdir postgres_data

asi tendra los permisos que deberia tener para correr sin problemas
