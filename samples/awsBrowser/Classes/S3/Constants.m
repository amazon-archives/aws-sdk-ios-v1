
#import "Constants.h"


@implementation Constants

static AmazonS3Client* s3 = nil;
static AmazonSimpleDBClient* sdb = nil;

+(AmazonS3Client*)s3 {
	if ( s3 == nil ) {
		s3 = [[AmazonS3Client alloc] initWithAccessKey:ACCESS_KEY withSecretKey:SECRET_KEY];
	}
	return s3;
}

+(AmazonSimpleDBClient*)sdb {
	if ( sdb == nil ) {
		sdb = [[AmazonSimpleDBClient alloc] initWithAccessKey:ACCESS_KEY withSecretKey:SECRET_KEY];				
	}
	return sdb;	
}

+(UIAlertView*)credentialsAlert {
	return [[UIAlertView alloc] initWithTitle:@"AWS Credentials" message:CREDENTIALS_ALERT_MESSAGE delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
}

@end
