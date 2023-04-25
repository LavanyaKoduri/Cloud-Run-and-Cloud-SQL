#! /bin/bash

export PROJECT_ID=docker-demo-384011
export REGION=us-central1
export CONNECTION_NAME=docker-demo-384011:us-central1:poll-database

gcloud builds submit \
  --tag gcr.io/$PROJECT_ID/poll \
  --project $PROJECT_ID

gcloud run deploy poll \
  --image gcr.io/$PROJECT_ID/poll \
  --platform managed \
  --region $REGION \
  --allow-unauthenticated \
  --add-cloudsql-instances $CONNECTION_NAME \
  --project $PROJECT_ID