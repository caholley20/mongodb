use admin
db.createUser(
    {
                 "user" : "pmonuser",
                 "pwd": "secretpwd",
                 "roles" : [ { role: "clusterMonitor", db: "admin" },
                             { role: "readAnyDatabase", db: "admin" },
                             { role: "clusterManager", db: "admin" },
                             { role: "hostManager", db: "admin" },
                             { role: "readWrite", db: "test" }
                             ] });

quit

db.getSiblingDB("admin").createRole({ "role": "pbmAnyAction",
      "privileges": [
         { "resource": { "anyResource": true },
           "actions": [ "anyAction" ]
         }
      ],
      "roles": []
   });
db.getSiblingDB("admin").createUser({user: "pbmuser",
       "pwd": "secretpwd",
       "roles" : [
          { "db" : "admin", "role" : "readWrite", "collection": "" },
          { "db" : "admin", "role" : "backup" },
          { "db" : "admin", "role" : "clusterMonitor" },
          { "db" : "admin", "role" : "restore" },
          { "db" : "admin", "role" : "pbmAnyAction" }
       ]
    });
