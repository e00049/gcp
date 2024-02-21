# 01. Authentication:

	gcloud config configurations list
	gcloud config configurations create development
	gcloud config set account development@e00049-projects-workspace.iam.gserviceaccount.com (or)
	gcloud auth activate-service-account --key-file=development.json
	gcloud config set project e00049-projects-workspace

	gcloud config configurations activate default


# 02. Handling Service Accounts:

	gcloud iam service-accounts list
	gcloud iam service-accounts create production 
	gcloud iam service-accounts update production@e00049-projects-workspace.iam.gserviceaccount.com --display-name="production-service-account" --description="production-service-account"
	gcloud iam service-accounts keys create production.json --iam-account=production@e00049-projects-workspace.iam.gserviceaccount.com
	gcloud iam service-accounts delete production@e00049-projects-workspace.iam.gserviceaccount.com	


# 03. Creating Roles:

	gcloud iam roles create myCompanyAdmin --project=e00049-projects-workspace --title="My-Company-Admin" --description="My custom role description." --permissions="iam.roles.get,iam.roles.list" --stage=ALPHA

storage-viewer-role.yaml

title: "Storage Viewer"
description: "Role granting read access to Cloud Storage buckets."
stage: "GA"
includedPermissions:
  - storage.objects.list
  - storage.objects.get
  - storage.buckets.get
  
	gcloud iam roles list --project=e00049-projects-workspace 
	gcloud iam roles create storageViewerRole --file=storage-viewer-role.yaml --project=e00049-projects-workspace
	gcloud iam roles update storageViewerRole --project=e00049-projects-workspace --file=storage-viewer-role.yaml
	gcloud iam roles delete storageViewerRole --project=e00049-projects-workspace

	gcloud projects add-iam-policy-binding e00049-projects-workspace --member=serviceAccount:production@e00049-projects-workspace.iam.gserviceaccount.com --role=projects/e00049-projects-workspace/roles/storageViewerRole


# 04. Billing

	gcloud billing accounts list

	gcloud services list --enabled
	gcloud services list --enabled --filter=NAME:compute.googleapis.com
	gcloud services enable compute.googleapis.com

	gcloud billing budgets create --billing-account=014337-3A8F71-42C706 --display-name="BUDGET1" --budget-amount=100.75USD --threshold-rule=percent=0.50 --threshold-rule=percent=0.75,basis=forecasted-spend



