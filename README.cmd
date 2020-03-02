Will install mongodb and a default config file on a Centos/Red Hat Mongo server 
Will provide sample config files for replica set and user creation stored in mongodb/scripts.

Phase I - Will continue to update this to include additional functionality.

Step 1

Assumes the following 

Percona user was created and has sudo access 

mongodb device was created with standard device name /dev/sdb   

unzip and ansible has been installed on the boxes

Step 2 

Run mongodb_install.yml 
Will install Community Edition of Mongodb 4.0.14 ( Change for mongodb Versions ) 



Step 3 

Run mongodb_centos.yml

Will install all OS related tasks for operating on Centos/Red Hat 

Will open ports that Centos/RedHat will need for Mongodb that is not standard.

If you need additional ports, please run command with the new ports.

Will copy standard mongod config file, and update the service file to use it. 
