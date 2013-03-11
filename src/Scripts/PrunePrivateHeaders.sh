#!/bin/sh

HEADER_PATH=$1

# remove internal headers from the path
rm -f `find -L $HEADER_PATH -name "*Marshaller*" -or -name "*Unmarshaller*" -or -name "S3ErrorResponseHandler*" -or -name "*_Internal.h"`
