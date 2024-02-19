gcloud config configurations list
gcloud config configurations create development
gcloud config set account development@e00049-projects-workspace.iam.gserviceaccount.com #Not this if you use json
gcloud auth activate-service-account --key-file=development.json
gcloud config set project e00049-projects-workspace
