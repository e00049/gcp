from google.cloud import storage

def authenticate_implicit_with_adc(project_id):
    try:
        storage_client = storage.Client(project=project_id)

        print("Existing Buckets:")
        for bucket in storage_client.list_buckets():
            print("Bucket -:", bucket.name)

    except Exception as e:
        print("An error occurred:", e)


project_id = "e00049-projects-workspace"
authenticate_implicit_with_adc(project_id)
