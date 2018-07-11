# Install virtualhost
    => Step 1: go to vagrant : open "terminal" -> go to "cd vagrant" folder -> run "vagrant up" -> run "vagrant ssh"
    => Step 2: edit virtualhost file : run sudo vi /etc/apache2/sites-available/000-default.conf
    => step 3: input data
```php
<VirtualHost *:80>
    ServerAdmin webmaster@mvpapi.local
    DocumentRoot "/var/www/projects/mvpapi"
    ServerName mvpapi.local
    <Directory "/var/www/projects/mvpapi">
       AllowOverride All
       Options Indexes MultiViews FollowSymLinks
       Require all granted
    </Directory>
    ErrorLog "/var/log/apache2/admvpapimin.local-error_log"
    CustomLog "/var/log/apache2/mvpapi.local-access_log" common
</VirtualHost>
<VirtualHost *:80>
    ServerAdmin webmaster@mvpga.local
    DocumentRoot "/var/www/projects/mvpga"
    ServerName mvpga.local
    <Directory "/var/www/projects/mvpga">
       AllowOverride All
       Options Indexes MultiViews FollowSymLinks
       Require all granted
    </Directory>
    ErrorLog "/var/log/apache2/mvpga.local-error_log"
    CustomLog "/var/log/apache2/apimvpgaelas.local-access_log" common
</VirtualHost>

<VirtualHost *:80>
    ServerAdmin webmaster@erp.local
    DocumentRoot "/var/www/projects/erp"
    ServerName erp.local
    <Directory "/var/www/projects/erp">
       AllowOverride All
       Options Indexes MultiViews FollowSymLinks
       Require all granted
    </Directory>
    ErrorLog "/var/log/apache2/erp.local-error_log"
    CustomLog "/var/log/apache2/erp.local-access_log" common
</VirtualHost>

```


    => Step4: change host file : run  sudo vi /etc/hosts  and input
```php
127.0.0.1 erp.local mvpapi.local mvpga.local
```

    => Step 5: Go to host file of real computer and change host
```php
10.9.1.3 rest.local gross.local apimail.local apipub.local apiinter.local apielas.local admin.local
```
=> Done setup virtual host