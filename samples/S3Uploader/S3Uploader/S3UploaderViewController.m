/*
 * Copyright 2010-2012 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import "S3UploaderViewController.h"

#import "Constants.h"
#import <AWSiOSSDK/S3/AmazonS3Client.h>


@implementation S3UploaderViewController

-(void)viewDidLoad
{
    if ( [ACCESS_KEY_ID isEqualToString:@"CHANGE ME"]) {
        [[Constants credentialsAlert] show];
    }
}

-(IBAction)selectPhoto:(id)sender
{
    UIImagePickerController *imagePicker = [[[UIImagePickerController alloc] init] autorelease];

    imagePicker.delegate = self;
    [self presentModalViewController:imagePicker animated:YES];
}

-(IBAction)showInBrowser:(id)sender
{
    // Initial the S3 Client.
    AmazonS3Client *s3 = [[[AmazonS3Client alloc] initWithAccessKey:ACCESS_KEY_ID withSecretKey:SECRET_KEY] autorelease];

    @try {
        // Set the content type so that the browser will treat the URL as an image.
        S3ResponseHeaderOverrides *override = [[[S3ResponseHeaderOverrides alloc] init] autorelease];
        override.contentType = @"image/jpeg";

        // Request a pre-signed URL to picture that has been uplaoded.
        S3GetPreSignedURLRequest *gpsur = [[[S3GetPreSignedURLRequest alloc] init] autorelease];
        gpsur.key                     = PICTURE_NAME;
        gpsur.bucket                  = [Constants pictureBucket];
        gpsur.expires                 = [NSDate dateWithTimeIntervalSinceNow:(NSTimeInterval) 3600]; // Added an hour's worth of seconds to the current time.
        gpsur.responseHeaderOverrides = override;

        // Get the URL
        NSURL *url = [s3 getPreSignedURL:gpsur];

        // Display the URL in Safari
        [[UIApplication sharedApplication] openURL:url];
    }
    @catch (AmazonClientException *exception) {
        [Constants showAlertMessage:exception.message withTitle:@"Browser Error"];
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // Get the selected image.
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];

    // Convert the image to JPEG data.
    NSData *imageData = UIImageJPEGRepresentation(image, 1.0);

    // Initial the S3 Client.
    AmazonS3Client *s3 = [[[AmazonS3Client alloc] initWithAccessKey:ACCESS_KEY_ID withSecretKey:SECRET_KEY] autorelease];

    @try {
        // Create the picture bucket.
        [s3 createBucket:[[[S3CreateBucketRequest alloc] initWithName:[Constants pictureBucket]] autorelease]];

        // Upload image data.  Remember to set the content type.
        S3PutObjectRequest *por = [[[S3PutObjectRequest alloc] initWithKey:PICTURE_NAME inBucket:[Constants pictureBucket]] autorelease];
        por.contentType = @"image/jpeg";
        por.data        = imageData;

        // Put the image data into the specified s3 bucket and object.
        [s3 putObject:por];
    }
    @catch (AmazonClientException *exception) {
        [Constants showAlertMessage:exception.message withTitle:@"Upload Error"];
    }

    [picker dismissModalViewControllerAnimated:YES];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissModalViewControllerAnimated:YES];
}

@end
