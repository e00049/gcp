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
		log.Fatalf("Failed to create Client: %v", err)
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

// List of functions have been used here...
// - Background
// - NewClient
// - Fatalf
// - Close
// - Buckets
// - Next
// - Println
