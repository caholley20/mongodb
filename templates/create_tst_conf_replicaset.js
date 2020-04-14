#configure_rs_cfg.sh
export env=$(hostname | cut -d'-' -f1 | cut -c 6-)
export project=$(hostname -f | cut -d '.' -f3-)

mongo --port 27019 <<EOF
rs.initiate(
  {
    _id: "mongo${env}-cfg",
    configsvr: true,
    members: [
      { _id : 0, host : "mongo${env}-cfg01.c.${project}:27019" },
      { _id : 1, host : "mongo${env}-cfg02.c.${project}:27019" },
      { _id : 2, host : "mongo${env}-cfg03.c.${project}:27019" }
    ]
  }
)
EOF

