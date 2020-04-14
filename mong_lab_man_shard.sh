#/bin/bash

export env=tst
export size=500
export default=default

for i in {0..2}
do
  for j in {b..d}
  do
    gcloud beta compute --project=managed-services-269320 instances create ${env}-mon-shard-${j}0${i} --zone=us-east1-${j} --machine-type=n1-standard-8  --subnet=$default --network-tier=PREMIUM --maintenance-policy=MIGRATE --service-account=339547842816-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --image=centos-7-v20200309 --image-project=centos-cloud --boot-disk-size=100GB --boot-disk-type=pd-ssd --boot-disk-device-name=mongo${env}-s${j}0${i}-boot --create-disk=mode=rw,size=${size},type=projects/managed-services-269320/zones/us-east1-${j}/diskTypes/pd-ssd,name=mongo${env}-s${j}0${i}-d01,device-name=mongo${env}-s${j}0${i}-d01  --create-disk=mode=rw,size=150,type=projects/managed-services-269320/zones/us-east1-${j}/diskTypes/pd-ssd,name=monlog${env}-s${j}0${i}-d01,device-name=monlog${env}-s${j}0${i}-d01 --reservation-affinity=any
  done
done



