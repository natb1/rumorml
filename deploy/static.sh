#!/bin/bash
set -eu
  
#babel client --out-dir build
aws s3 cp --acl public-read index.html s3://rumor.ml/index.html
aws s3 cp --recursive --exclude "*.sw?" --acl public-read public s3://rumor.ml/public
aws s3 cp --recursive --exclude "*.sw?" --acl public-read client s3://rumor.ml/client

