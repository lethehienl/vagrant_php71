# Install virtualhost
=> Step 1: go to vagrant : open "terminal" -> go to "cd vagrant" folder -> run "vagrant up" -> run "vagrant ssh"
=> Step 2: edit virtualhost file : run sudo vi /etc/apache2/sites-available/000-default.conf
=> step 3: input data

<VirtualHost *:80>
    ServerAdmin webmaster@rest.local
    DocumentRoot "/var/www/html/projects/gks/restposten.de"
    ServerName mvpapi.local
    <Directory "/var/www/html/projects/gks/restposten.de">
       AllowOverride All
       Options Indexes MultiViews FollowSymLinks
       Require all granted
    </Directory>
    ErrorLog "/var/log/apache2/rest.local-error_log"
    CustomLog "/var/log/apache2/rest.local-access_log" common
</VirtualHost>

<VirtualHost *:80>
    ServerAdmin webmaster@newapi.local
    DocumentRoot "/var/www/html/projects/newgks/newapi"
    ServerName mvp.local
    <Directory "/var/www/html/projects/newgks/newapi">
       AllowOverride All
       Options Indexes MultiViews FollowSymLinks
       Require all granted
    </Directory>
    ErrorLog "/var/log/apache2/newapi.local-error_log"
    CustomLog "/var/log/apache2/newapi.local-access_log" common
</VirtualHost>

=> Step4: change host file : run  sudo vi /etc/host  and input

127.0.0.1 rest.local gross.local apimail.local apipub.local apiinter.local apielas.local admin.local

=> Step 5: Go to host file of real computer and change host

10.9.1.3 rest.local gross.local apimail.local apipub.local apiinter.local apielas.local admin.local

=> Done setup virtual host