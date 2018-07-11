#Install Vagrant 

1. Install virtualbox
    - https://www.virtualbox.org/wiki/Downloads
2. Install Vagrant
    - https://www.vagrantup.com/downloads.html
3. Setup vagrant
    - get vagrant dev from :git clone git@github.com:gksgmbh/dev-env-vagrant.git vagrant 
    - Go to vagrant folder and create projects folder
    - Setup projects:
        + MVPAPI : git clone git@github.com:gksgmbh/ga_mvp_api.git mvpapi
        + MVPGA :  git clone git@github.com:gksgmbh/admin-tool-mvp.git mvpga
        + ERP :    git clone git@github.com:gksgmbh/ERP-Integration-Scripts.git erp
    - and then run : vagrant up
    - and then run vagrant ssh

4. Install Setup virtulhoast
     - Following "virtualhost.md" file
     - Link: https://drive.google.com/open?id=1qmUEu5F6_gL9GfdvdZxfMdRrPU-frMFm

5. Insert  database from https://github.com/gksgmbh/mysql/blob/master/ga_mvp/db.sql.zip

6. Information:
    - PHPMYADMIN : admin acc : admin | admin
    - MYSQL :  db acc : admin | admin
    - APACHE2
    - PHP 7.2
    - ELASTICSEARCH 6.3
    - KIBANA 6.3
    
Ps: don't forget change .env file into each project (change database config)
```php
DB_HOST=127.0.0.1
DB_USER=admin
DB_PASSWD=admin
DB_NAME=newgks
DB_PORT=3306
```