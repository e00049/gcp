# to list out buckets using gcloud commnad
    gcloud storage ls

# - to create bucket nearline - storage class, asia - location retention for 5 mints:
     gsutil mb -s nearline -l asia --retention 5s  gs://e00049 

# - to copy files from local to remote location:  
	  gsutil cp 01-gcloud-cli.sh gs://e00049 

# - to remove the files from bucket:   
	  gsutil rm -r gs://e00049/01-my-test.txt 

# - to delete bucket from gcp cloud
	  gsutil rb gs://e00049 
