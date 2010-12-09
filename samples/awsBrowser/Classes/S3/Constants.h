
#import <Foundation/Foundation.h>

#import <AWSiOSSDK/S3/AmazonS3Client.h>
#import <AWSiOSSDK/SimpleDB/AmazonSimpleDBClient.h>

#define ACCESS_KEY @"CHANGE ME"
#define SECRET_KEY @"CHANGE ME"

#define CREDENTIALS_ALERT_MESSAGE @"Please update the Constants.h file with your credentials."

@interface Constants : NSObject {
}

+(AmazonS3Client*)s3;
+(AmazonSimpleDBClient*)sdb;
+(UIAlertView*)credentialsAlert;

@end
