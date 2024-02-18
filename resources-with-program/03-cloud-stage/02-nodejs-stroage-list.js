// import { Storage } from '@google-cloud/storage'; // ES6 Model import

const { Storage } = require('@google-cloud/storage');

const storage = new Storage();

async function listBuckets() {
    const [ buckets ] = await storage.getBuckets();

    console.log('Buckets:');
    buckets.forEach(buckets => {
        console.log(buckets.name);        
    });
}

listBuckets().catch(console.error)
