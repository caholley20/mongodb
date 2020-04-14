use admin
db.createUser(
 {
   user: "root",
   pwd: "secretpwd",
   roles: [ { role: "root", db: "admin" }]
 }
);

quit
