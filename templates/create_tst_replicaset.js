export env=$(hostname | cut -d'-' -f1 | cut -c 6-)
export shardno=$(hostname | tail -c3)
export project=$(hostname -f | cut -d '.' -f3-)

mongo --port 27018 <<EOF
rs.initiate(
  {
    _id: "mongo${env}-s${shardno}",
    members: [
      { _id : 0, host : "mongo${env}-sa${shardno}.c.${project}:27018" },
      { _id : 1, host : "mongo${env}-sb${shardno}.c.${project}:27018" },
      { _id : 2, host : "mongo${env}-sc${shardno}.c.${project}:27018" }
    ]
  }
)
EOF

