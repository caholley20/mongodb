#/bin/bash
export env=prd
export default=default
export zone=us-east1

#gcp1

gcloud beta compute --project=managed-services-269320 instances create ${env}-mon-blze-cfg01 --zone=${zone}-b --machine-type=custom-8-16384 --subnet=$default --network-tier=PREMIUM --maintenance-policy=MIGRATE --service-account=339547842816-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --image=centos-7-v20200309 --image-project=centos-cloud --boot-disk-size=100GB --boot-disk-type=pd-ssd --boot-disk-device-name=mongo${env}-cfg01-boot --create-disk=mode=rw,size=150,type=projects/managed-services-269320/zones/${zone}-b/diskTypes/pd-ssd,name=mongo${env}-cfg01-d01,device-name=mongo${env}-cfg01-d01 --reservation-affinity=any

#gcp2
gcloud beta compute --project=managed-services-269320 instances create ${env}-mon-blze-cfg02 --zone=us-${zone}-c --machine-type=custom-8-16384 --subnet=$default --network-tier=PREMIUM --maintenance-policy=MIGRATE --service-account=339547842816-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --image=centos-7-v20200309 --image-project=centos-cloud --boot-disk-size=100GB --boot-disk-type=pd-ssd --boot-disk-device-name=mongo${env}-cfg02-boot --create-disk=mode=rw,size=150,type=projects/managed-services-269320/zones/${zone}-c/diskTypes/pd-ssd,name=mongo${env}-cfg02-d01,device-name=mongo${env}-cfg02-d01 --reservation-affinity=any


#gcp3
gcloud beta compute --project=managed-services-269320 instances create ${env}-mon-blze-cfg03 --zone=${zone}-d --machine-type=custom-8-16384 --subnet=$default --network-tier=PREMIUM --maintenance-policy=MIGRATE --service-account=339547842816-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --image=centos-7-v20200309 --image-project=centos-cloud --boot-disk-size=100GB --boot-disk-type=pd-ssd --boot-disk-device-name=mongo${env}-cfg03-boot --create-disk=mode=rw,size=150,type=projects/managed-services-269320/zones/${zone}-d/diskTypes/pd-ssd,name=mongo${env}-cfg03-d01,device-name=mongo${env}-cfg03-d01 --reservation-affinity=any
