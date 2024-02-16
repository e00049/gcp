# sudo wget https://dl.google.com/go/go1.22.0.linux-amd64.tar.gz
# sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.22.0.linux-amd64.tar.gz	
# export PATH=$PATH:/usr/local/go/bin
	
# go install google.golang.org/api/iterator@latest
# go install cloud.google.com/go/storage@latest
# go mod tidy


package main

import (
    "context"
    "fmt"
    "log"

    "cloud.google.com/go/storage"
    "google.golang.org/api/iterator"
)

func main() {
    projectID := "e00049-projects-workspace"

    ctx := context.Background()

    client, err := storage.NewClient(ctx)
    if err != nil {
        log.Fatalf("Failed to create client: %v", err)
    }
    defer client.Close()

    it := client.Buckets(ctx, projectID)
    for {
        attrs, err := it.Next()
        if err == iterator.Done {
            break
        }
        if err != nil {
            log.Fatalf("Failed to list buckets: %v", err)
        }
        fmt.Println(attrs.Name)
    }
}
