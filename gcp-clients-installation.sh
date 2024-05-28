#!/usr/bin/env bash


sudo apt-get install apt-transport-https ca-certificates gnupg -y  && \
echo "deb https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - && \
sudo apt-get update && sudo apt-get install google-cloud-cli -y && \
sudo apt-get install google-cloud-cli* -y


gcloud auth activate-service-account --key-file=/tmp/e00049-project-workspace.json
export GOOGLE_APPLICATION_CREDENTIALS="/tmp/e00049-projects-workspace.json"

---------------------------------------------------------------------------------------
# Using gcloud command:

- LIST OUT the buckers:
	gcloud storage ls
		
-------------------------------------------------------------------------------------

# Install Node.JS

sudo apt update && \
sudo apt-get install build-essential -y && \
curl -sL https://deb.nodesource.com/setup_20.x | sudo -E bash - && \
sudo apt-get install -y nodejs

npm install @google-cloud/storage

// --------------------------------------------------------------------------------------

# Installing Python:
sudo apt install python3-pip -y
pip3 install google-cloud-storage

// -----------------------------------------------------------------------------------------

# Installal GoLang:
	
sudo wget https://dl.google.com/go/go1.22.0.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.22.0.linux-amd64.tar.gz	
export PATH=$PATH:/usr/local/go/bin
	
go install google.golang.org/api/iterator@latest
go install cloud.google.com/go/storage@latest
go get -u google.golang.org/api/iterator
go get -u cloud.google.com/go/storage

go mod init tidy


// -------------------------------------------------------------------------------------------------------

# install Terraform:

sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform -y
terraform -help

terraform import google_storage_bucket.my-state-bucket e00049 

terraform state list -> google_storage_bucket.my-state-bucket

terraform state rm google_storage_bucket.my-state-bucket

--------------------------------------------------------------------------------------------
