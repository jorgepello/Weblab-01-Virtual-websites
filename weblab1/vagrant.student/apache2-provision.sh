#!/bin/bash

# Crear el directorio del sitio
mkdir -p /var/www/apolo.olimpo.test

# Copiar los archivos del sitio apolo
cp -r /vagrant/files/apolo.olimpo.test/* /var/www/apolo.olimpo.test/

# Copiar la configuración del Virtual Host de aopolo
cp /vagrant/config/apolo.olimpo.test.conf /etc/apache2/sites-available/

# Copiar los archivos del sitio de atenea
cp -r /vagrant/files/atenea.olimpo.test/* /var/www/atenea.olimpo.test/

# Copiar la configuración del Virtual Host de atenea
cp /vagrant/config/atenea.olimpo.test.conf /etc/apache2/sites-available/

# Habilitar el sitio
a2ensite apolo.olimpo.test.conf

# Habilitar el sitio
a2ensite atenea.olimpo.test.conf

# Borrar el archivo por defecto de apache 
a2dissite 000-default.conf

# Reiniciar Apache
systemctl restart apache2

