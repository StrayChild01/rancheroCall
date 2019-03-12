# RancheroCall
### Filtrando las llamadas indeseadas con un rasbperry pi y un fax-módem.

_Este proyecto es para documentar los pasos que seguí al hacer el rancheroCall_

Originalmente, seguí los pasos del [este](https://murphy101blog.wordpress.com/2013/11/03/raspberry-pi-telephone-number-blocker/) blog, pero es muy viejo. Además, tampoco me gusta compilar.

Pasos:
- Se habilita el puerto serial del Pi.
- En la siguiente [dirección](https://sourceforge.net/projects/ncid/files/ncid/) se busca la versión más nueva de _ncid_ que en este caso es 1.10.1, o sea **ncid_1.10.1-1_armhf.deb**
- Se selecciona el archivo y se copia la URL.
- En el directorio de $HOME, se hace lo siguiente:
```bash
wget "https://sourceforge.net/projects/ncid/files/ncid/1.10.1/ncid_1.10.1-1_armhf.deb/download" -O "ncid_1.10.1-1_armhf.deb"
```
- Se instala.
```bash
sudo dpkg -i ncid_1.10.1-1_armhf.deb # Se instala el paquete.
sudo apt-get -f install # Se instalan dependencias
```
- Como el módem [Sewell SW-221171](https://www.amazon.com.mx/gp/product/B005EHJ3FW) funciona sin problemas _out of the box_ entonces no necesitamos instalar drivers.
- Para hacer pruebas, usamos el programa minicom
```bash
sudo minicom -s
```
- Se configura con 115200 baudios
- Se guarda la configuración
- Se prueba el módem
```bash
sudo minicom
# Dentro de la consola se escribe
AT
# si recibe el comando responde
OK.
# Al marcar con el minicom, se ve lo siguiente:
RING
# Para contestar 
ATH0
# OK
# Para colgar
ATH1
```
- CTRL+A y X, para salir y reniciar el módem.
- Para editar la configuración de ncid, se edita el archivo _/etc/ncid/ncid.conf_ (Dentro del repositorio)
- Para que funcione el archivo de la lista negra, se descomenta la línea.
- Se hacen pruebas.
- Para editar la lista negra se edita el archivo _/etc/ncid/ncidd.blacklist_
- Para que los cambios hechos en _blacklist_ se vean reflejados, se tiene que reiniciar el servidor. ```sudo systemctl restart ncidd```

### Actualización

Para poder ver las llamadas, hice un [notebook de python](Llamadas%20cobranza.ipynb "llamadas cobranza") para bajar y _parsear_ el archivo. Después de eso, genera un gráfico en HTML que luego se puede visualizar [aquí](https://straychild01.github.io/rancheroCall/ "grafica")
