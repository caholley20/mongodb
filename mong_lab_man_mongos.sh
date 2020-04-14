#/bin/bash

#export zone=a

#gcloud beta compute --project=managed-services-269320 instances create tst-mon-mongos-0 --zone=us-east1-${zone} --machine-type=custom-8-15360 --subnet=default --network-tier=PREMIUM --maintenance-policy=MIGRATE --service-account=339547842816-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --image=centos-7-v20200309 --image-project=centos-cloud --boot-disk-size=100GB --boot-disk-type=pd-ssd --boot-disk-device-name=mongotst-mongos0-boot --reservation-affinity=any

