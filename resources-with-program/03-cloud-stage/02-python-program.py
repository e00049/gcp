from google.cloud import storage

def authenticate_implicit_with_adc(project_id, bucket_name):
    try:
        storage_client = storage.Client(project=project_id)

        print("Existing buckets:")
        bucket_exists = False
        for bucket in storage_client.list_buckets():
            print(bucket.name)
            if bucket.name == bucket_name:
                bucket_exists = True
                break

        if bucket_exists:
            storage_client.get_bucket(bucket_name).delete()
            print("Bucket {} deleted.".format(bucket_name))
        else:
            new_bucket = storage_client.create_bucket(bucket_name)
            print("Bucket {} created.".format(new_bucket.name))

    except Exception as e:
        print("An error occurred:", e)

# Call the function with project ID and bucket name
project_id = "e00049-projects-workspace"
bucket_name = "e00049"
authenticate_implicit_with_adc(project_id, bucket_name)


